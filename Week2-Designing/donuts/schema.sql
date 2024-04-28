CREATE TABLE "ingredients"(
    "id" INTEGER,
    "ingredient" TEXT NOT NULL,
    "price_per_gram" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts"(
    "name" TEXT NOT NULL,
    "gluten-free" BOOLEAN NOT NULL,
    "price" INTEGER NOT NULL,
    "ingredient_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE "orders"(
    "id" INTEGER,
    "donut_ordered" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_ordered") REFERENCES "donuts"("name")
);


CREATE TABLE "orders_of_customers"(
    "customer_id" INTEGER,
    "order_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);
