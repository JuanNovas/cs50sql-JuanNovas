SELECT players.first_name, players.last_name, salaries.salary, performances.HR, performances.year FROM players
INNER JOIN salaries ON salaries.player_id = players.id
INNER JOIN performances ON performances.player_id = players.id
WHERE salaries.year = performances.year
ORDER BY players.id ASC, salaries.year DESC, performances.HR DESC, salaries.salary DESC;
