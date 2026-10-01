-- Write your PostgreSQL query statement below
with cte as (
    select
        num
        ,count(*)
    from mynumbers
    group by num
    having count(*) = 1
)
select
    max(num) as num
from cte;
