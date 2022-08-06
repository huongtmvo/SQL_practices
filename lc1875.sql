1875. Group Employees of the Same Salary

-- Solution: 

with s as (
    select salary, row_number() over (order by salary) as team_id
    from employees
    group by salary
    having count(*) > 1
    )
select e.*, s.team_id
from s join employees e on s.salary = e.salary
order by team_id, employee_id;