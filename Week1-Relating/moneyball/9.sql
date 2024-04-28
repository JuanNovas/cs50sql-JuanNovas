SELECT teams.name, ROUND(AVG(salaries.salary), 2) AS "average salary" FROM teams
INNER JOIN salaries ON salaries.team_id = teams.id
WHERE salaries.year = 2001
GROUP BY teams.id
ORDER BY ROUND(AVG(salaries.salary), 2) ASC
LIMIT 5;
