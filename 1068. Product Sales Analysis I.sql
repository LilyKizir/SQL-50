select product_name, year, price
from sales as s
left join product as p
on s.product_id = p.product_id
