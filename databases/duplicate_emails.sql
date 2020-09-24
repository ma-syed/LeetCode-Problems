-- https://leetcode.com/problems/duplicate-emails/
# Write your MySQL query statement below
SELECT Email
FROM Person
GROUP by Email
HAVING COUNT(Email)>1;