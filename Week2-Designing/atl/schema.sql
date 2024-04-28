CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "airlines"(
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ("A","B","C","D","E","F","T"))
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline" TEXT,
    "departing_airport" TEXT NOT NULL,
    "heading_airport" TEXT NOT NULL,
    "expected_departure" DATETIME NOT NULL,
    "expected_arrival" DATETIME NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline") REFERENCES "airlines"("name")
);


CREATE TABLE "checkins"(
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "date" DATE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);


