# Write your MySQL query statement below
with weather_comparison as (
    select *
    ,lag(recordDate, 1) over (order by recordDate asc) as prev_date
    ,lag(temperature, 1) over (order by recordDate asc) as prev_temp
    from weather
)
select
    id
from weather_comparison
where temperature > prev_temp and datediff(recorddate, prev_date) = 1;