SELECT districts.name, expenditures.per_pupil_expenditure FROM districts INNER JOIN expenditures ON expenditures.district_id = districts.id
WHERE districts.id IN (SELECT district_id FROM schools WHERE "type" = "Public School")
AND districts.state = "MA"
ORDER BY expenditures.per_pupil_expenditure DESC LIMIT 10;
