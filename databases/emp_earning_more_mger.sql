-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
# Write your MySQL query statement below
SELECT e1.Name as Employee
FROM Employee e1
INNER JOIN Employee e2 on e1.ManagerId = e2.Id
WHERE e1.Salary > e2.Salary;