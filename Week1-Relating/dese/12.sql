SELECT DISTINCT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary FROM districts
INNER JOIN expenditures ON expenditures.district_id = districts.id
INNER JOIN staff_evaluations ON staff_evaluations.district_id = districts.id
INNER JOIN schools on schools.district_id = districts.id
WHERE schools.type = "Public School" AND expenditures.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
AND staff_evaluations.exemplary > (select AVG(exemplary) FROM staff_evaluations)
ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC;
