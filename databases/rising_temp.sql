-- https://leetcode.com/problems/rising-temperature/
# Write your MySQL query statement below
SELECT w1.Id
FROM Weather w1
INNER JOIN Weather w2 on DATEDIFF(w1.RecordDate, w2.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;