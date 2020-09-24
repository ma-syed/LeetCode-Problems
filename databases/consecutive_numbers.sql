-- https://leetcode.com/problems/consecutive-numbers/
# Write your MySQL query statement below

SELECT DISTINCT s.Num ConsecutiveNums
FROM
(
    SELECT Num,
    LEAD (Num,1) OVER (ORDER BY Id) lead_num,
    LAG (Num,1) OVER (ORDER BY Id) lag_num
    FROM Logs
) s
WHERE s.Num = s.lead_num AND s.NUM = s.lag_num

;