select unique_id, name
from employees as e
left join employeeuni as u
on e.id = u.id
