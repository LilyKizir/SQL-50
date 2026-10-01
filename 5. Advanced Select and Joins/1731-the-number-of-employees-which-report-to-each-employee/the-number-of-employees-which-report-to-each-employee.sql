-- Write your PostgreSQL query statement below
with cte as (
    select
        employee_id as grunt
        ,reports_to as boss
        ,age as grunt_age
    from employees
)
select
    employee_id
    ,name
    ,count(*) as reports_count
    ,round(avg(grunt_age),0) as average_age
from employees
inner join cte
    on cte.boss = employees.employee_id
-- where reports_to IS NULL
group by 1,2
order by 1;