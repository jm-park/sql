/*
# [LeetCode] 596. Classes More Than 5 Students
# https://leetcode.com/problems/classes-more-than-5-students/
# out all classes which have more than or equal to 5 students.
*/

-- 내 답안: 497 ms
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) > 4
