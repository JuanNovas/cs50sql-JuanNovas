
-- *** The Lost Letter ***

SELECT * FROM packages WHERE from_address_id = (SELECT id FROM addresses WHERE "address" = "900 Somerville Avenue");
--a congratulatory letter was sent to a address id 854 and the id of the package is 384
SELECT * FROM scans WHERE package_id = 384;
--the letter was drop at an address id of 854
SELECT * FROM addresses WHERE id = 854;
--the letter was sent to 2 Finnigan Street


-- *** The Devious Delivery ***

SELECT * FROM packages WHERE from_address_id IS NULL;
--the duck was sent to an adrress id of 50
SELECT * FROM scans WHERE package_id = 5098;
--the duck was drop at an addrress_id of 348
SELECT * FROM addresses WHERE id = 348;
--the duck was finally sent to a police station


-- *** The Forgotten Gift ***

SELECT * FROM packages WHERE from_address_id = (SELECT id FROM addresses WHERE "address" = "109 Tileston Street")AND to_address_id = (SELECT id FROM addresses WHERE "address" = "728 Maple Place");
--flowers with an id of 9523
SELECT * FROM scans WHERE package_id = 9523;
--package was drop at a diferent locationd and picked un by a driver with an id of 17
SELECT * FROM drivers WHERE id = 17;
--mikel have the flowers
