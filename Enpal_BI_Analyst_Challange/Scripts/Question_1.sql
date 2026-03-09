SELECT COUNT (DISTINCT LEAD_ID) FROM leads ; 
SELECT COUNT (DISTINCT LEAD_CREATED_DATE) FROM leads ;
SELECT COUNT (DISTINCT MARKETING_CHANNEL) FROM leads ; 
SELECT COUNT (DISTINCT SALES_FUNNEL_STEPS) FROM sales_funnel ; 





SELECT 
    MIN(l.LEAD_CREATED_DATE) AS min_date,
    MAX(s.CASE_CLOSED_SUCCESSFUL_DATE) AS max_date
FROM leads l
LEFT JOIN sales_funnel s 
    ON l.LEAD_ID = s.LEAD_ID

/* Question 1 Answer */

SELECT 
MIN(l.LEAD_CREATED_DATE) As Min_Date,
MAX(s.CASE_CLOSED_SUCCESSFUL_DATE) as MaxDate

From leads l   

join sales_funnel s on l.LEAD_ID = s.LEAD_ID 


--Common Table Expression (CTE)
--Temporary table 
--While execution created
--Not stored 


with cte1 as (
SELECT 
MIN(LEAD_CREATED_DATE) As Min_Date
from leads 
),
cte2 as(
SELECT 
MAX(CASE_CLOSED_SUCCESSFUL_DATE) As Max_Date
from sales_funnel 
)
select * from cte1 cross join cte2

--Temp table 
--Created with #temp




SELECT LEAD_ID, COUNT(*) 
FROM leads 
GROUP BY LEAD_ID 
HAVING COUNT(*) > 1;




SELECT LEAD_ID, COUNT(*) 
FROM sales_funnel 
GROUP BY LEAD_ID 
HAVING COUNT(*) > 1;



SELECT  LEAD_CREATED_DATE 
From leads 
Where LEAD_CREATED_DATE = NULL



SELECT  CASE_CLOSED_SUCCESSFUL_DATE 
From sales_funnel 
Where CASE_CLOSED_SUCCESSFUL_DATE = NULL




Select *
from sales_funnel


Select *
from leads












