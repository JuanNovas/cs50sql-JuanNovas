CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "user_conections"(
    "userA_id" INTEGER,
    "userB_id" INTEGER,
    FOREIGN KEY("userA_id") REFERENCES "users"("id"),
    FOREIGN KEY("userB_id") REFERENCES "users"("id")
);

CREATE TABLE "school_conections"(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "affiliation" DATETIME NOT NULL,
    "end_affiliation" DATETIME,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_conections"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "affiliation" DATETIME NOT NULL,
    "end_affiliation" DATETIME,
    "position" TEXT,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
