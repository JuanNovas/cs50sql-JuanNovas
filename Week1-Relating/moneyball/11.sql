SELECT players.first_name, players.last_name,
(salaries.salary / performances.H)
AS "dollars per hit" FROM salaries
INNER JOIN performances ON salaries.player_id = performances.player_id
INNER JOIN players on players.id = performances.player_id
WHERE salaries.year = 2001  AND performances.year = 2001 AND performances.H != 0
ORDER BY "dollars per hit", first_name, last_name
LIMIT 10;
