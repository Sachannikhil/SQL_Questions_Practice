-- QUESTION 1). Find most profitable movies of each year
SELECT * FROM subquery.movies
WHERE (year,gross-budget) IN (SELECT year,MAX(gross-budget) FROM subquery.movies
GROUP BY year);


-- QUESTION 2). Find the Highest rated movie of each genre votes cut-of off 25000 --

SELECT * FROM subquery.movies
WHERE (genre,score) IN (SELECT genre,MAX(SCORE) FROM subquery.movies
WHERE votes > 25000
GROUP BY genre);

-- QUESTION 3). Find the all movies that have the rating higher than the average rating of movies in the same genre --

SELECT * FROM subquery.movies m1
WHERE score > (SELECT AVG(score) FROM subquery.movies m2 WHERE m2.genre = m1.genre);

-- QUESTION 4).
USE subquery;

SELECT t1.name,t4.f_name,COUNT(*) FROM subquery.users t1
JOIN subquery.orders t2 ON t1.user_id = t2.user_id
JOIN subquery.order_details t3 ON t2.order_id = t3.order_id
JOIN subquery.food t4 ON t3.f_id = t4.f_id
GROUP BY t2.user_id,t3.f_id 