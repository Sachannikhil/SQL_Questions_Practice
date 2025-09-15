USE campusx;
-- first value()

-- Question 1). Highest value in the data
SELECT*,
FIRST_VALUE(name) OVER(ORDER BY marks DESC) AS 'First_Value'
FROM campusx.marks;


-- LAST VALUE() 
SELECT *,
LAST_VALUE(marks) OVER(ORDER BY marks DESC 
ROWS BETWEEN unbounded preceding AND unbounded following) AS 'LastValue'
FROM marks;

-- NTH VALUE
SELECT *,
NTH_VALUE(name,2) OVER(ORDER BY marks DESC 
ROWS BETWEEN unbounded preceding AND unbounded following) AS 'LastValue'
FROM marks;

-- Question 3).Find the each branch topper,name,marks,branch
SELECT name,branch,marks FROM(SELECT*,
                   FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Topper_name',
				   FIRST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Topper_marks'
                   FROM marks) t
			WHERE t.marks = Topper_marks AND t.name = Topper_name;

-- Question 4). Find the each branch last student,name,marks,branch
SELECT name,branch,marks FROM(SELECT*,
                   LAST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC
                   
                          ROWS BETWEEN unbounded preceding AND unbounded following) AS 'Topper_name',
                          
				   LAST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC
                   ROWS BETWEEN unbounded preceding AND unbounded following) AS 'Topper_marks'
                   FROM marks) t
			WHERE t.marks = Topper_marks AND t.name = Topper_name;
            
            
-- Question4). This is the very Headach process so we use the w window function instead of
SELECT name,branch,marks FROM(SELECT*,
                   LAST_VALUE(name) OVER w AS 'Topper_name',
                          
				   LAST_VALUE(marks) OVER w AS 'Topper_marks'
                   FROM marks) t
			WHERE t.marks = Topper_marks AND t.name = Topper_name
            WINDOW w AS (PARTITION BY branch ORDER BY marks DESC
                   ROWS BETWEEN unbounded preceding AND unbounded following);
                   
-- LAG(), LEAD() FUNCTION IN WINDOW
SELECT *,
LAG(marks) OVER(ORDER BY student_id),
LEAD(marks) OVER(ORDER BY student_id)
FROM marks;


-- IF WE DO THE PARTITION BY THEN-->
SELECT *,
LAG(marks) OVER(PARTITION BY branch ORDER BY student_id),
LEAD(marks) OVER(PARTITION BY branch ORDER BY student_id)
FROM marks;

 -- Question 5).Find the MoM Revnue of Zomato dataset

USE zomato;
SELECT MONTHNAME(date),SUM(amount),
(SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY MONTH(date))/LAG(SUM(amount)) OVER (ORDER BY MONTH(date) ))*100
FROM orders
GROUP BY MONTHNAME(date)
ORDER BY MONTHNAME(date) DESC 







