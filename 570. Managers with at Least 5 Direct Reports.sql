with managers as (
    select managerId, count(*) as count
    from employee
    where managerId is not null
    group by managerId
)

select e.name
from managers as m
join employee as e
on m.managerId = e.id
where m.count >= 5
