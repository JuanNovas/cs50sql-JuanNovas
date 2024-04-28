SELECT "name" FROM schools WHERE city IN (SELECT city FROM districts WHERE "type" = "Public School");
