SELECT count(id) FROM players WHERE NOT bats = throws AND bats IN ("R", "L") AND throws IN ("R","L");
