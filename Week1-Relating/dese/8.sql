SELECT districts.name, expenditures.pupils FROM districts INNER JOIN expenditures on expenditures.district_id = districts.id;
