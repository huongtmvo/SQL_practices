# 1741
select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by event_day, emp_id ;


# lc 1571
select name as warehouse_name, sum(units* Width*Length*Height) as volume
from Warehouse 
join Products on Warehouse.product_id = Products.product_id
group by warehouse_name;


# lc 1873
select employee_id,
    case 
        when name not like 'M%' and employee_id % 2 = 1 then salary
        else 0
    end as bonus
from Employees
order by employee_id ;


# lc 1890
select user_id, max(time_stamp) as last_stamp 
from Logins 
WHERE time_stamp >= '2020-01-01' and time_stamp < '2021-01-01' 
group by user_id

# where time_stamp between '2020-01-01' and '2020-12-31' (not work)

