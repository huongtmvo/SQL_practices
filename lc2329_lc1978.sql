--lc 2329
select user_id, sum(quantity*price) as spending
from Sales
left join Product
on Sales.product_id = Product.product_id 
group by user_id 
order by spending desc, user_id;


-- lc 1978
select employee_id 
from Employees
where salary < 30000 and manager_id not in 
(select employee_id from Employees)
order by employee_id; 
-- Note: select null not in (2,3,4) -> NULL


-- safer solution: 
select employee_id 
from Employees
where salary < 30000 
      and manager_id is not null 
      and manager_id not in 
          (select employee_id from Employees)
order by employee_id; 


