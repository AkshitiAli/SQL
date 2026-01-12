# Write your MySQL query statement below
SELECT e.Name
FROM Employee e
JOIN Employee m
ON e.Id = m.ManagerId
GROUP BY e.Id, e.Name
HAVING COUNT(m.Id) >= 5;
