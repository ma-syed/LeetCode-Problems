-- https://leetcode.com/problems/department-highest-salary/
# Write your MySQL query statement below
SELECT d.Name Department, e.Name Employee, e.Salary
FROM Employee e INNER JOIN Department d
on e.DepartmentId = d.Id
INNER JOIN
(
    SELECT DepartmentId Id, MAX(Salary) Salary
    FROM Employee
    GROUP by 1
) d2
ON d.id = d2.id
WHERE e.Salary = d2.Salary;