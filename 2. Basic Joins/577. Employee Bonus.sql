select name, bonus
from employee as e
left join bonus as b
on e.empId = b.empId
where bonus is null or bonus < 1000
