-- lc 1098
select book_id, name 
from Books
where available_from < date_sub('2019-06-23', interval 1 month) 
and book_id not in (
    select book_id 
    from Orders 
    where (dispatch_date between date_sub('2019-06-23', interval 1 year)  and '2019-06-23')
    group by book_id
    having sum(quantity) >= 10)
    
    
-- lc 176
select (
    select distinct salary from Employee order by salary desc limit 1,1) as SecondHighestSalary
    

-- Solution 2: use max() function
select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from Employee)

-- max() will return a null if the value does not exist. If the second highest value is guranteed to exist, use limit 1,1
-- ifnull(val, null) will not return 'null' if the value is empty 
