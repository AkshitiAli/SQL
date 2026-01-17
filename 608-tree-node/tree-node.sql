# Write your MySQL query statement below
SELECT 
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN t.id IN (SELECT p_id FROM Tree) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree t;
