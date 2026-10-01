-- Write your PostgreSQL query statement below
with cte as (
    select
        employee_id
        ,department_id
        ,primary_flag
        ,count(*) over (partition by employee_id) as count
    from employee
order by employee_id
)
, cte2 as ( 
    select 
        employee_id
        ,   CASE
                when primary_flag = 'N' and count = 1 then department_id
                when primary_flag = 'Y' then department_id
            END AS department_id
    from cte
)
select *
from cte2
where department_id is not null;