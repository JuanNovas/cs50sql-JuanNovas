-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--- Inserting Data

-- Users table
-- Each time a new buyer makes a purchase he will be included in the users table
-- Base query
INSERT INTO "users"(name) VALUES ('Name Last_name');
-- Example
INSERT INTO "users"(name) VALUES ('Juan Novas');

-- Producers table
-- Each time products are buy to a new producer it will be added to the table
-- Base query
INSERT INTO "producers"(name) VALUES ('Producer_name');
-- Example
INSERT INTO "producers"(name) VALUES ('HyperX');

-- Pay Method table
-- Each time the business starts to acept a new pay method
-- Base query
INSERT INTO "pay_method"(method) VALUES ('New method');
-- Example
INSERT INTO "pay_method"(method) VALUES ('Paypal');

-- Products table
-- Each time a new product is put on sale
-- Base query
INSERT INTO "products"(name,producer_id,buy_price,sell_price,stock)
VALUES ('Name',N,N,N,N);
-- Example
INSERT INTO "products"(name,producer_id,buy_price,sell_price,stock)
VALUES ('Alloy Origins Core',1,20,30,30);

-- Sales table
-- Each time a sale is made
-- Base query
INSERT INTO "sales"(product_id,user_id,price,amount,pay_method_id)
VALUES (N,N,N,N,N);
-- Example
INSERT INTO "sales"(product_id,user_id,price,amount,pay_method_id)
VALUES (1,1,30,2,1); -- Two Alloy Origins Core sold to Juan Novas for 30 dolars each via paypal

--- Viewing Data

-- Checking products sold to a specific user
-- Base query
SELECT * from "sales_all" WHERE "buyer" == 'Name';
SELECT * from "sales_all" WHERE "buyer" LIKE '%Name%';
-- Example
SELECT * from "sales_all" WHERE "buyer" == 'Juan Novas';
SELECT * from "sales_all" WHERE "buyer" LIKE '%Novas%';

-- Checking products in stock
SELECT * FROM "in_stock";
SELECT * FROM "no_stock";

-- Checking sales
-- All
SELECT * FROM "sales_all";
-- Last week
SELECT * FROM "week_sales";

-- Cheking revenue
SELECT * FROM "day_revenue";
SELECT * FROM "week_revenue";
SELECT * FROM "month_revenue";

-- Checking most selled products in the las month
SELECT * FroM "most_selled";


--- Updating Data
-- Adding stock
-- Base query
UPDATE "products" SET "stock" = "stock" + N WHERE "id" = N;
UPDATE "products" SET "stock" = "stock" + N WHERE "name" = 'S';
-- Example
UPDATE "products" SET "stock" = "stock" + 10 WHERE "id" = 1;
UPDATE "products" SET "stock" = "stock" + 10 WHERE "name" = 'Alloy Origins Core';
