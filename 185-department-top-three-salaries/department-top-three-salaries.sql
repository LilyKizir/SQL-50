# Write your MySQL query statement below
with salaries as (
    select
        e.id as emplid
        ,e.name as employee
        ,e.salary as salary
        ,d.id as depid
        ,d.name as department
    from employee e
        left join department d
        on e.departmentId = d.id
),
ranking as (
    select
        *
        , dense_rank() over (
            partition by department
            order by salary desc) as earner_rank
    from salaries
)
select
    department
    ,employee
    ,salary
from ranking
where earner_rank <= 3;