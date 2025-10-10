-- Question 1). Find out the average sleep duration of 
-- top 15 male candidates who's 
-- sleep duration are equal to 7.5 or greater than 7.5.

SELECT AVG(`Sleep duration`) FROM sleep
WHERE `Sleep duration` >= 7.5 AND Gender = 'Male'
ORDER BY `Sleep duration` DESC LIMIT 15;

-- Question :- Find out the lowest 10th to 30th light sleep percentage records 
--             where deep sleep percentage values are between 25 to 45. 
--             Display age, light sleep percentage and 
--             deep sleep percentage columns only.
SELECT `Deep sleep percentage`;

-- Question:- Group by on exercise frequency and smoking status and 
-- show average deep sleep time, 
-- average light sleep time and avg rem sleep time.

SELECT `Exercise frequency`,`Smoking status`,AVG(`Deep sleep percentage`) FROM sleep
GROUP BY `Exercise frequency`,`Smoking status`



