                               -- DATA CLEANING USING SQL 
                               
                               
                               -- CREATE backup copy
CREATE TABLE laptop_backup LIKE laptop;

INSERT INTO laptop_backup
SELECT * FROM laptop;



                              --  Check memory consumption
                              
SELECT * FROM information_schema.TABLE
WHERE TABLE_SCHEMA = 'campusx'
AND TABLE_NAME = 'laptop';



                               -- To Drop th unwanted column
ALTER TABLE laptop
DROP COLUMN `Unnamed:0`;



--                                 -- To find the NULL values in Data                          
DELETE FROM campusx.laptop
WHERE `Unnamed: 0` IN (SELECT `Unnamed: 0` FROM campusx.laptop
	  WHERE Company IS NULL AND TypeName IS NULL AND 
      Inches IS NULL AND ScreenResolution IS NULL AND Cpu IS NULL AND 
      Ram IS NULL AND Memory IS NULL AND Gpu IS NULL AND OpSys IS NULL AND 
      Weight IS NULL AND Price IS NULL );
      
    
    
    
                                   -- Drop Duplicates
SELECT name,age,gender,COUNT(*)
FROM campusx
GROUP BY name,age,gender
HAVING COUNT(*) >1;


                                   -- Clean RAM --> Change col datatype
USE campusx;
SELECT DISTINCT(Company) FROM laptop;

                                  --  DATATYPE CHANGEMENT
ALTER TABLE laptop MODIFY COLUMN Inches DECIMAL(10,2);


                                   -- REPLACE
UPDATE laptop l1
SET Ram = (SELECT REPLACE(Ram,'GB','') FROM laptop l2
        WHERE l2.`Unnamed: 0` = l1.`Unnamed: 0`);


ALTER TABLE laptop MODIFY COLUMN Ram INT NOT NULL;


                  -- IF ELSE CONSITIONAL STAMENT
SELECT OpSys,
CASE
     WHEN OpSys LIKE '%mac%' THEN 'Macos'
     WHEN OpSys LIKE '%window%' THEN 'Window'
     WHEN OpSys LIKE '%linux%' THEN 'Linux'
     ELSE 'Others'
END AS 'OTHER'
FROM laptop;


UPDATE laptop
SET OpSys = CASE
     WHEN OpSys LIKE '%mac%' THEN 'Macos'
     WHEN OpSys LIKE '%window%' THEN 'Window'
     WHEN OpSys LIKE '%linux%' THEN 'Linux'
     WHEN OpSys LIKE '%NO OS%' THEN 'NO_OS'
     ELSE 'Others'
END;

-- MAKE THE NEW COLUMN 

ALTER TABLE laptop
ADD COLUMN gpu_brand VARCHAR(255) AFTER Gpu,
ADD COLUMN gpu_name VARCHAR(255) AFTER gpu_brand;



SELECT SUBSTRING_INDEX(Gpu,' ',1) FROM laptop


  






