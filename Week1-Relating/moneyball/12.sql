SELECT first_name, last_name FROM (
    SELECT first_name, last_name FROM players WHERE id IN (SELECT players.id FROM players INNER JOIN salaries ON salaries.player_id = players.id
    INNER JOIN performances ON performances.player_id = players.id
    WHERE salaries.year = 2001  AND performances.year = 2001 AND performances.RBI != 0
    ORDER BY (salaries.salary/performances.RBI) ASC LIMIT 10)
) INTERSECT
SELECT first_name, last_name FROM (
    SELECT first_name, last_name FROM players WHERE id IN (SELECT players.id FROM players INNER JOIN salaries ON salaries.player_id = players.id
    INNER JOIN performances ON performances.player_id = players.id
    WHERE salaries.year = 2001  AND performances.year = 2001 AND performances.H != 0
    ORDER BY (salaries.salary/performances.H) ASC LIMIT 10)
) ORDER BY last_name;
