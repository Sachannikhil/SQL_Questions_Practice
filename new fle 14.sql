							-- 📌 UPDATE Query Questions


-- Question 1). Update the marks of Rupesh to 65.

UPDATE year.marks
SET marks = "80"
WHERE name = "Rupesh";


-- Question 2).Increase marks of all students in the EEE branch by 5.
UPDATE year.marks
SET marks = marks+5
WHERE branch = "EEE";


-- Question 3).Decrease marks of all students in the MECH branch by 10.
UPDATE year.marks
SET marks = marks-10
WHERE branch = "MECH";

-- Question 4).Update the branch of Vinay from 'ECE' to 'CSE'.
UPDATE year.marks
SET branch = 'CSE'
WHERE name = 'Vinay';

-- Question 5).Set marks of all students who scored less than 50 to exactly 50.
UPDATE year.marks
SET marks = "50"
WHERE marks< 50;

-- Question 6).Increase marks of Deepak by 2 and of Arpan by 3.
UPDATE year.marks
SET marks = CASE
            WHEN name = "Deepak" THEN marks +2
            WHEN name = "Arpan" THEN marks +3
            END
WHERE name IN  ('Deepak','Arpan');

-- Question 7). Change the branch of all students with marks greater than 90 to 'Toppers'.
UPDATE year.marks
SET branch = 'Topper'
WHERE marks > 90;

-- Question 8).Update the name of Anukant to 'Anu'.
UPDATE year.marks
SET name = "Anu"
WHERE name = "Anukant";

-- Question 9). Increase marks of all students in 'CSE' branch by 10%.
UPDATE year.marks
SET marks = marks *1.10
WHERE branch = "CSE";

-- Question 10).Set marks of all 'ECE' students to NULL.
UPDATE year.marks
SET marks = null
WHERE branch = "ECE";

SELECT * FROM year.marks;










						 --  📌 SELECT Query Questions
		
        
-- Question 1).Show the names of all students in the CSE branch.
        
SELECT name FROM year.marks
WHERE branch = "CSE";
			
            
-- Question 2).List the names of students whose marks are between 60 and 90.  
SELECT * FROM year.marks
WHERE marks BETWEEN 60 AND 90;


-- Question 3).Show all students sorted by marks in descending order.
SELECT * FROM year.marks
ORDER BY marks DESC;

-- Question 4).Display the highest marks in the table.   
SELECT MAX(marks) FROM year.marks;


-- Question 5). Find the total number of students in each branch.
SELECT branch,COUNT(*)
FROM year.marks
GROUP BY branch;


-- Question 6).Display the names of students who have marks equal to 95
SELECT name,marks
FROM year.marks
WHERE marks = 95;

-- Question 7).Show the top 3 students with the highest marks.
 SELECT * FROM year.marks
 ORDER BY marks DESC LIMIT 3;
 
-- Question 8).Find all students whose names start with 'A'.
SELECT * FROM year.marks
WHERE name LIKE 'A%';

-- Question 9).Display distinct branch names from the table.
SELECT DISTINCT(branch) FROM year.marks;

-- Question 10).Show students who belong to 'EEE' or 'ECE'.
SELECT * FROM year.marks
WHERE branch IN ("EEE","ECE")
 