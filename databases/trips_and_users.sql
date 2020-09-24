-- https://leetcode.com/problems/trips-and-users/
# Write your MySQL query statement below
WITH TMP as
(
    SELECT t.Request_at,
    COUNT(t.Request_at) total_counts,
    SUM(CASE
        WHEN  (DATEDIFF(t.Request_at,'2013-10-01') >= 0 AND DATEDIFF(t.Request_at,'2013-10-01') < 3) AND (t.`Status` = 'cancelled_by_driver' OR  t.`Status` = 'cancelled_by_client') THEN 1
        ELSE 0
    END) checks
    FROM Trips t
    INNER JOIN Users c ON t.Client_Id = c.Users_id
    INNER JOIN Users d on t.Driver_Id = d.Users_id
    WHERE c.Banned = 'No' AND d.Banned = 'No'
    GROUP BY 1    
)
SELECT Request_at Day, CAST(checks/ total_counts AS DECIMAL(4,2)) 'Cancellation Rate'
FROM TMP
WHERE (DATEDIFF(Request_at,'2013-10-01') >= 0 AND DATEDIFF(Request_at,'2013-10-01') < 3);
