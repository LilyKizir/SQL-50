# Write your MySQL query statement below
select
    activity_date as day
    ,count( distinct user_id ) as active_users
from activity
where activity_date <= '2019-07-27' and activity_date > date_sub('2019-07-27', INTERVAL 30 DAY)
group by day;