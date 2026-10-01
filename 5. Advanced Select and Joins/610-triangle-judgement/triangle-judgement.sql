-- Write your PostgreSQL query statement below
select
    *
    ,CASE
        when x + y <= z then 'No'
        when y + z <= x then 'No'
        when x + z <= y then 'No'
        else 'Yes'
    END AS triangle
from triangle;