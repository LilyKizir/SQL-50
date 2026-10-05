-- Write your PostgreSQL query statement below
with cte as (
    select 
        *
        ,sum(weight) over (order by turn asc) as c_weight
    from queue)
select
    person_name
from cte
where c_weight <= 1000
order by c_weight desc
limit 1;