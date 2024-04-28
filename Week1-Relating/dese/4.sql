SELECT "city", count(*) FROM schools WHERE "type" = "Public School" GROUP BY "city" ORDER BY count(*) DESC, "city" LIMIT 10;
