-- Write your PostgreSQL query statement below
with total_users as (
    select
        count(*) as users_count
    from users
),
contest_registration as (
    select
        contest_id,
        count(*) over (partition by contest_id) as register_count
    from register
)
select distinct
    contest_id
    ,round((register_count*100.00)/users_count, 2) as percentage
from contest_registration
    cross join total_users
order by percentage desc, contest_id asc