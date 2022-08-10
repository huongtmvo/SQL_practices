-- lc 1077:  Project Employees II

WITH cte AS
  (SELECT project_id,
          Project.employee_id,
          name,
          experience_years
   FROM Project
   JOIN Employee ON Project.employee_id = Employee.employee_id)
SELECT project_id, employee_id
FROM cte
WHERE (project_id, experience_years) in
    (SELECT project_id, max(experience_years)
     FROM cte
     GROUP BY project_id);