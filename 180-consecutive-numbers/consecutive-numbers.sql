-- Write your PostgreSQL query statement below
with cte as (
    SELECT distinct
        CASE 
            WHEN LEAD(num, 1) OVER (ORDER BY id) = LEAD(num, 2) OVER (ORDER BY id) 
            AND num = LEAD(num, 2) OVER (ORDER BY id) 
            THEN num 
        END AS ConsecutiveNums
    FROM logs
)
select 
    *
from cte
where ConsecutiveNums is not null;