-- QUESTION :- Find the Highest rated movie of each genre votes cut-of off 25000 --

SELECT * FROM subquery.movies
WHERE (genre,score) IN (SELECT genre,MAX(SCORE) FROM subquery.movies
WHERE votes > 25000
GROUP BY genre)