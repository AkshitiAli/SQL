# Write your MySQL query statement below
WITH top_students AS (
    SELECT user_id
    FROM course_completions
    GROUP BY user_id
    HAVING COUNT(*) >= 5
       AND AVG(course_rating) >= 4
),
student_courses AS (
    SELECT
        c.user_id,
        c.course_name,
        c.completion_date,
        LEAD(c.course_name) OVER (
            PARTITION BY c.user_id
            ORDER BY c.completion_date
        ) AS next_course
    FROM course_completions c
    JOIN top_students t 
      ON c.user_id = t.user_id
)
SELECT
    course_name AS first_course,
    next_course AS second_course,
    COUNT(*) AS transition_count
FROM student_courses
WHERE next_course IS NOT NULL
GROUP BY course_name, next_course
ORDER BY transition_count DESC, first_course, second_course;
