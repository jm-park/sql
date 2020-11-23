/*
# [LeetCode] 626. Exchange Seats
# https://leetcode.com/problems/exchange-seats/
# change seats for the adjacent students. 인접 row와 student 값 swap
*/

-- 내 소스: 488 ms
SELECT id,
       (CASE WHEN MOD(id, 2) = 1 THEN DECODE(NEXT_STU, NULL, student, NEXT_STU)
             ELSE DECODE(PREV_STU, NULL, student, PREV_STU) END) AS student
FROM (
    SELECT id, 
        student,
        LEAD(student) OVER(ORDER BY id) AS NEXT_STU,
        LAG(student) OVER(ORDER BY id) AS PREV_STU
    FROM seat
)

--  딴사람: 148ms 
select (case
            when mod(id,2) = 0 then id - 1
            when mod(id,2) = 1 and id != (select max(id) from seat) then id + 1
        else id end) as id
        , student
from seat
order by id;

-- Solution: MYSQL
SELECT
    s1.id, COALESCE(s2.student, s1.student) AS student
FROM
    seat s1
        LEFT JOIN
    seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id: MYSQL
ORDER BY s1.id
