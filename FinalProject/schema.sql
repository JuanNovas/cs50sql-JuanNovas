-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--- Tables
-- Users
-- In this table the data of the buyers will be stored. Including the name, more information could be added but it would not be really usefull.
-- This table will be usefull to see all the purchases for a especific user and save space as, intead of saving a full name each time this person
-- buys something, an id will be stored.
-- This will only be usefull if a buyer buys things freequently, so, for business who rarely sells more than one good per consumer this approach is not efficient
CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- Producers
-- In this table the data of the producers will be stored in the same way of the "users" table.
-- This will be beneficial for filtering products and being able to check if a particular brand is out of stock.
-- Or, in countries with high inflation (like mine) to be able with a simple query to increase the total of products of this producer,
-- since normally the increases tend to be even among all their products.
CREATE TABLE "producers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- Pay Method
-- This table is used for the same thing as the 2 above, to save space while also keeping information
-- The "method" row is an open text row instead of a set of values because each business could have a lot of diferents pay methods and
-- this aproach will be more flexible. And because of the aproach of dividing the pay method into another table any new pay method
-- could be added with a query like "INSERT INTO "pay_method" ("method") VALUES ('new method')"
CREATE TABLE "pay_method" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "method" TEXT NOT NULL
);

-- Products
-- This table stores the data of each product that the business sells
-- This is helpfull to check the stock, buy price and producers of a good and others things like the sell price
-- And having a separate table to store the data of each product take less space than having this information in the sales table
CREATE TABLE "products" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "producer_id" INTEGER,
    "buy_price" INTEGER,
    "sell_price" INTEGER,
    "stock" INTEGER,
    FOREIGN KEY("producer_id") REFERENCES "producers"("id")
);

-- Sales
-- This table stores the data of each sale,
-- including the information of who is the buyer, the product, the price, method and date, whe last one being automatic
-- This table is the main table of the database and the most important, all the others complement this
CREATE TABLE "sales" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "product_id" INTEGER NOT NULL,
    "user_id" INTEGER,
    "price" INTEGER,
    "amount" INTEGER,
    "pay_method_id" INTEGER,
    "date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("product_id") REFERENCES "products"("id"),
    FOREIGN KEY("pay_method_id") REFERENCES "pay_method"("id")
);


--- Views
-- In Stock
-- This view shows wich products are in stock
-- Ordering them by producer
CREATE VIEW "in_stock" AS
SELECT products.name, producers.name AS producer, products.buy_price,products.sell_price, products.stock
FROM products LEFT JOIN producers ON products.producer_id = producers.id
WHERE products.stock > 0
ORDER BY producer, products.name;

-- No Stock
-- This view shows wich products are not in stock
-- Ordering them by producer
CREATE VIEW "no_stock" AS
SELECT products.name, producers.name AS producer, products.buy_price,products.sell_price
FROM products LEFT JOIN producers ON products.producer_id = producers.id
WHERE products.stock = 0
ORDER BY producer, products.name;

-- Week Sales
-- This view shows the sales from the last week
CREATE VIEW "week_sales" AS
SELECT products.name as "product", users.name as "buyer", sales.price, sales.amount, pay_method.method, sales.date
FROM sales
LEFT JOIN products ON products.id = sales.product_id
LEFT JOIN users on users.id = sales.user_id
LEFT JOIN pay_method on pay_method.id = sales.pay_method_id
WHERE sales.date >= DATE('now', '-7 days')
ORDER BY sales.date DESC;

-- Day Revenue
-- This view shows the revenue of the day
-- If a product do not have a "buy_price" value it would not be consider
CREATE VIEW "day_revenue" AS
SELECT sum((sales.price - products.buy_price) * sales.amount) AS "day revenue"
FROM sales LEFT JOIN products ON products.id = sales.product_id
WHERE DATE(sales.date) = DATE('now', 'localtime');

-- Week Revenue
-- This view shows the revenue of the last seven days
-- If a product do not have a "buy_price" value it would not be consider
CREATE VIEW "week_revenue" AS
SELECT sum((sales.price - products.buy_price) * sales.amount) AS "week revenue"
FROM sales LEFT JOIN products ON products.id = sales.product_id
WHERE sales.date >= DATE('now', '-7 days');

-- Month Revenue
-- This view shows the revenue of the last 30 days
-- If a product do not have a "buy_price" value it would not be consider
CREATE VIEW "month_revenue" AS
SELECT sum((sales.price - products.buy_price) * sales.amount) AS "month revenue"
FROM sales LEFT JOIN products ON products.id = sales.product_id
WHERE sales.date >= DATE('now', '-30 days');

-- Most Selled
-- This view shows the 5 most selled products in the las month
CREATE VIEW "most_selled" AS
SELECT products.name AS "product", SUM(sales.amount) AS "amount"
FROM sales LEFT JOIN products on sales.product_id = products.id
GROUP BY sales.product_id
HAVING sales.date >= DATE('now', '-30 days')
ORDER BY "amount" DESC
LIMIT 5;

-- Sales All
-- This view shows the sales table replacing the "id" references with the values
CREATE VIEW "sales_all" AS
SELECT sales.id, products.name as "product", users.name as "buyer", sales.price, sales.amount, pay_method.method as "pay_method", sales.date
FROM sales LEFT JOIN products on products.id = sales.product_id
LEFT JOIN users on users.id = sales.user_id
LEFT JOIN pay_method ON pay_method.id = sales.pay_method_id
ORDER BY sales.date DESC;


--- Indexes
-- Sales Dates
-- This index will apply to the "date" column of the table "sales"
-- This will speed up the views related with dates
CREATE INDEX "sales_date"
ON sales (date);

-- Products Names
-- This index will apply to the "name" column of the table "products
-- This will speed up the querys related with a especific product
CREATE INDEX "products_names"
ON products (name);


--- Triggers
-- Sale
-- This trigger will update the stock on the "products" table when a sale is made
CREATE TRIGGER "sale"
AFTER INSERT ON "sales"
FOR EACH ROW
BEGIN
    UPDATE "products" SET "stock" = "stock" - NEW.amount
    WHERE products.id = NEW.product_id;
END;
