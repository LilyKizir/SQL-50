-- Write your PostgreSQL query statement below
select distinct
    query_name
    ,round(avg(cast(rating as decimal) / position) over(partition by query_name), 2) as quality
    ,round(count(*) filter (where rating < 3) over (partition by query_name) * 100.00 / count(query_name) over (partition by query_name), 2) as poor_query_percentage
from queries