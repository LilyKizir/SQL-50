-- Write your PostgreSQL query statement below
with total_prod as (
    select
        count(*)
    from product
)
, cte as(
    select
        customer_id
        ,count (distinct product_key)
        ,min(count)
    from customer
    cross join total_prod
    group by 1
)
select
    customer_id
from cte
where count = min;