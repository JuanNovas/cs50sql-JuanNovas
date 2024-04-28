SELECT districts.name FROM districts WHERE id in (SELECT district_id FROM expenditures WHERE pupils = (SELECT MIN(pupils) FROM expenditures));
