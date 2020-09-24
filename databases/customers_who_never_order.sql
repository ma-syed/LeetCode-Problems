-- https://leetcode.com/problems/customers-who-never-order/
# Write your MySQL query statement below
-- Method 1:
-- SELECT Name as Customers
-- FROM Customers
-- WHERE Id NOT IN
-- (
--    SELECT DISTINCT CustomerId FROM Orders
-- );

-- Method 2:
SELECT a.Name Customers
FROM
(
    SELECT c.Name, o.Id Ids
    FROM Customers c
    LEFT JOIN
    Orders o
    ON c.Id = o.CustomerId
) a
WHERE a.Ids IS NULL;