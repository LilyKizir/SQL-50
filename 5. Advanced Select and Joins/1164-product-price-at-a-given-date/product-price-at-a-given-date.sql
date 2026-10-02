-- Write your PostgreSQL query statement below
with cte as (
    select distinct
        product_id
        ,10 as price
    from Products
),
cte2 as (
    select
        *
        ,max(change_date) over (partition by product_id)
    from Products
    where change_date <= '2019-08-16'
)
, cte3 as (
    select * 
    from cte2
    where change_date = max
)
select 
    cte.product_id
    ,coalesce(new_price, 10) as price
from cte
left join cte3
    on cte.product_id = cte3.product_id