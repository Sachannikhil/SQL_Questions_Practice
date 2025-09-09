-- QUESTION 3). Find the all movies that have the rating higher than the average rating of movies in the same genre --

SELECT * FROM subquery.movies m1
WHERE score > (SELECT AVG(score) FROM subquery.movies m2 WHERE m2.genre = m1.genre)