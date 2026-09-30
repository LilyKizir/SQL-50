-- Write your PostgreSQL query statement below
with flags as (
    select
        (min(order_date) over (partition by customer_id) = order_date)::int as is_first
        ,(customer_pref_delivery_date = order_date)::int as is_immediate
        ,((min(order_date) over (partition by customer_id) = order_date) and (customer_pref_delivery_date = order_date))::int as is_imm_first
    from delivery
)
select
    round(sum(is_imm_first * 100.00)/sum(is_first),2) as immediate_percentage 
from flags