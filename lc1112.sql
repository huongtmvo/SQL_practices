1112. Highest Grade For Each Student

-- Solution 1: Use subquerry

select student_id, min(course_id) as course_id, grade
from Enrollments
where (student_id, grade) in 
(select student_id, max(grade) from Enrollments 
group by student_id)
group by student_id, grade
order by student_id;


-- Solution 2: Use join
select a.student_id, min(b.course_id) as course_id, a.grade
from Enrollments b
inner join 
(select student_id, max(grade)as grade from Enrollments group by student_id) as a
on a.student_id = b.student_id and a.grade = b.grade
group by a.student_id, a.grade
order by a.student_id;

