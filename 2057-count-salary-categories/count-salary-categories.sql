-- Write your PostgreSQL query statement below
with cte1 as (
    select
        'Low Salary' as category
        ,sum(case when income < 20000 then 1 else 0 end) as accounts_count
    from accounts
)
,cte2 as (
    select
        'Average Salary' as category
        ,sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as accounts_count
    from accounts
)
,cte3 as (
    select
        'High Salary' as category
        ,sum(case when income > 50000 then 1 else 0 end) as accounts_count
    from accounts
)
select * from cte1
union
select * from cte2
union
select * from cte3;