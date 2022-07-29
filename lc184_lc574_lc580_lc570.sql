-- lc 184
select Department.name as Department, Employee.name as Employee, salary as Salary
from Employee join Department on Employee.departmentId = Department.id
where (Department.id, salary) in (
    select  departmentId, max(salary) from Employee group by departmentId) ; 
    
  
-- lc 574
-- Solution 1: 
select name from Candidate where id = 
    (select candidateId from Vote group by candidateId order by count(*) desc limit 1) ;
    
-- Solution 2: 
select Candidate.name from Candidate
join Vote on Candidate.id = Vote.candidateId 
group by Candidate.id 
order by count(*) desc limit 1; 


-- lc 580
select dept_name, count(student_id) as student_number
from Department
left join Student on Department.dept_id = Student.dept_id
group by Department.dept_id
order by student_number desc, dept_name;


-- lc 570
-- Solution 1: Use subquerry
select name from Employee where id in 
    (select managerId from Employee group by managerId having count(id) >= 5 order by count(id) );

-- Solution 2: Use self join
select b.name as name
from Employee a, Employee b
where a.managerId = b.id
group by a.managerId 
having count(a.id) >= 5;
