-- Write your PostgreSQL query statement below
with cte as (
    select 
        *
        ,(id - (case
            when (id % 2) = 1 then 1
            else 2
        end)) as cohort
    from seat
    order by cohort asc, id desc
)
select
    row_number() over ( order by cohort asc, id desc) as id
    ,student
from cte;