-- Write your PostgreSQL query statement below
with cte as (
    select
    product_id
    ,min(year) over (partition by product_id) as first_year
    ,year
    ,quantity
    ,price
from sales
)
select 
    product_id
    ,first_year
    ,quantity
    ,price
from cte
where first_year = year;