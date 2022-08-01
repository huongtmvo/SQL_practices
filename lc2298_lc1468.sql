-- lc 2298: Tasks count on weekend vs weekdays
select 
    (select count(*)  from Tasks where weekday(submit_date) in (5,6)) as weekend_cnt, 
    (select count(*) from Tasks where weekday(submit_date) not in (5,6)) as working_cnt
    

-- lc 1468: Calculate salaries for employees at different companies

select Salaries.company_id, employee_id, employee_name, round(salary*(1-tax_rate),0) as salary
from Salaries
join 
(select company_id, 
    case when max(salary) < 1000 then 0
    when max(salary) <= 10000 then 0.24
    when max(salary) > 10000 then 0.49
    end as tax_rate
from Salaries
group by company_id ) as Company_tax 
on Salaries.company_id = Company_tax.company_id


