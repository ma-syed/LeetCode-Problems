-- https://leetcode.com/problems/rank-scores/
# Write your MySQL query statement below
WITH ranked AS
(
    SELECT ROW_NUMBER() OVER (ORDER BY s.score DESC) `Rank`, s.score
    FROM (SELECT DISTINCT score FROM Scores) s
)
SELECT s.score, r.`Rank`
FROM Scores s
INNER JOIN ranked r on s.score = r.score
ORDER BY 1 DESC;