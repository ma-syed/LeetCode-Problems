-- https://leetcode.com/problems/delete-duplicate-emails/
# Write your MySQL query statement below
DELETE FROM Person
WHERE Id NOT IN
(
SELECT s.Id FROM
(
    SELECT Email, MIN(Id) Id
    FROM Person
    GROUP by 1
) s
);
SELECT * FROM Person;
