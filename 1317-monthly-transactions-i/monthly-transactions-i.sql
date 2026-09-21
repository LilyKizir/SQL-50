-- Write your PostgreSQL query statement below
select distinct
    to_char(trans_date, 'YYYY-MM') as month
    ,country
    ,count(*) over (partition by to_char(trans_date, 'YYYY-MM'), country) as trans_count
    ,count(*) filter (where state = 'approved') over (partition by to_char(trans_date, 'YYYY-MM'), country) as approved_count
    ,sum(amount) over (partition by to_char(trans_date, 'YYYY-MM'), country) as trans_total_amount
    ,coalesce(sum(amount) filter (where state = 'approved') over (partition by to_char(trans_date, 'YYYY-MM'), country), 0) as approved_total_amount
from transactions;