-- --Question 1). FIND THE TOP BATTESMAN AT THE IPL

-- RANKING() FUNCTION EXPLAINED
SELECT * FROM(SELECT BattingTeam,batter,SUM(batsman_run) AS 'Total_Run',
			  DENSE_RANK() OVER(PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC ) AS 'Rank_of_Batsman'
              FROM ipl
              GROUP BY BattingTeam,batter) t
WHERE t.Rank_of_Batsman < 6
ORDER BY t.BattingTeam,Rank_of_Batsman;


                                     -- CUMULATIVE SUM()
-- Question ). We want v_kholi 20th,50th,150th mathc run?

 SELECT * FROM (SELECT 
                CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS'Match_no',
                SUM(batsman_run) AS 'runs_scored',
                SUM(SUM(batsman_run)) OVER(ROWS between unbounded preceding AND current row) AS 'Career Run'
                FROM ipl
                WHERE batter = 'V Kohli'
                GROUP BY ID) t;
                
                
							-- CumulativeSum Avg
                            
-- Question). After every match v kohli average?
 SELECT * FROM (SELECT 
                CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS'Match_no',
                SUM(batsman_run) AS 'runs_scored',
                SUM(SUM(batsman_run)) OVER w AS 'Career Run',
                AVG(SUM(batsman_run)) OVER w  AS 'Avg_Run'
                FROM ipl
                WHERE batter = 'V Kohli'
                GROUP BY ID
                WINDOW w AS (ROWS between unbounded preceding AND current row)) t;
    
    
    
                                 -- RUNNING AVG()
                                 
-- Question 5).Current performance of the batter?
     SELECT * FROM (SELECT 
                CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS'Match_no',
                SUM(batsman_run) AS 'runs_scored',
                SUM(SUM(batsman_run)) OVER w AS 'Career Run',
                AVG(SUM(batsman_run)) OVER w  AS 'Avg_Run',
                AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS 'Running_Avg'
                FROM ipl
                WHERE batter = 'V Kohli'
                GROUP BY ID
                WINDOW w AS (ROWS between unbounded preceding AND current row)) t
    
