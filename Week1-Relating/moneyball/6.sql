SELECT teams.name, SUM(performances.H) FROM teams INNER JOIN performances ON performances.team_id = teams.id
WHERE performances.year = 2001
GROUP BY teams.id
ORDER BY SUM(performances.H) DESC
LIMIT 5;
