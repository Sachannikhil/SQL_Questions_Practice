-- Find most profitable movies of each year
SELECT * FROM subquery.movies
WHERE (year,gross-budget) IN (SELECT year,MAX(gross-budget) FROM subquery.movies
GROUP BY year)