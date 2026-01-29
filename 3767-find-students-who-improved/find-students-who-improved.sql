# Write your MySQL query statement below
WITH FirstAndLatest AS (
    SELECT
        student_id,
        subject,
        MIN(exam_date) AS first_date,
        MAX(exam_date) AS last_date
    FROM Scores
    GROUP BY student_id, subject
    HAVING COUNT(*) > 1
)
SELECT
    f.student_id,
    f.subject,
    s1.score AS first_score,
    s2.score AS latest_score
FROM FirstAndLatest f
JOIN Scores s1
    ON f.student_id = s1.student_id
   AND f.subject = s1.subject
   AND f.first_date = s1.exam_date
JOIN Scores s2
    ON f.student_id = s2.student_id
   AND f.subject = s2.subject
   AND f.last_date = s2.exam_date
WHERE s2.score > s1.score
ORDER BY f.student_id, f.subject;
