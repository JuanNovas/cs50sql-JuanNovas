.import --csv meteorites.csv temp


CREATE TABLE "meteorites"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT ,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT,
    "year" INTEGER DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    PRIMARY KEY("id")
);


DELETE FROM "temp" WHERE "nametype"="Relict";

UPDATE "temp"
SET "mass" = NULLIF("mass", '');
UPDATE "temp"
SET "year" = NULLIF("year", '');
UPDATE "temp"
SET "lat" = NULLIF("lat", '');
UPDATE "temp"
SET "long" = NULLIF("long", '');


INSERT INTO "meteorites" ("name", "class", "mass","discovery","year","lat","long")
SELECT "name", "class", round("mass",2),"dicovery",CAST("year" AS INTEGER),round("lat",2),round("long",2) FROM "temp" ORDER BY "year" ASC,"name";
