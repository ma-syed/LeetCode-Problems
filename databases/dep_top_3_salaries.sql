-- https://leetcode.com/problems/department-top-three-salaries/
# Write your MySQL query statement below
WITH DepMaxSal1 as 
(
    SELECT DepartmentId Id, MAX(SALARY) MaxSal
    FROM Employee
    GROUP BY 1
),
DepMaxSal2 as 
(
    SELECT e.DepartmentId Id, MAX(e.SALARY) MaxSal
    FROM Employee e INNER JOIN DepMaxSal1 d1
    ON e.DepartmentId = d1.Id
    WHERE e.Salary < d1.MaxSal
    GROUP BY 1
),
DepMaxSal3 as
(
    SELECT e.DepartmentId Id, MAX(e.SALARY) MaxSal
    FROM Employee e INNER JOIN DepMaxSal2 d2
    ON e.DepartmentId = d2.Id
    WHERE e.Salary < d2.MaxSal
    GROUP BY 1
)


SELECT d.Name Department, e.Name Employee, e.Salary
FROM Employee e
INNER JOIN Department d
on e.DepartmentId = d.Id
INNER JOIN DepMaxSal1 d1
on d.Id = d1.Id
LEFT JOIN DepMaxSal2 d2
on d.Id = d2.Id
LEFT JOIN DepMaxSal3 d3
on d.Id = d3.Id
WHERE e.Salary in (d1.MaxSal, d2.MaxSal, d3.MaxSal)