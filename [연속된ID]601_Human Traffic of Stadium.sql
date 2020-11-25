/*
# [LeetCode] 601. Human Traffic of Stadium
# https://leetcode.com/problems/human-traffic-of-stadium/
# 문제: display the records with "three or more rows with consecutive id's",
        and the number of people is "greater than or equal to 100" for each
        people 값이 100이상인, 3개이상 연속된 ID의 row 출력
*/

-- 627 ms, faster than 47.48%
SELECT distinct S1.id AS "id",
       TO_CHAR(S1.visit_date, 'YYYY-MM-DD') AS "visit_date",
       S1.people AS "people"
FROM Stadium S1, Stadium S2, Stadium S3
WHERE S1.people >= 100 AND S2.people >= 100 AND S3.people >= 100
AND (
    (S1.id - S2.id = 1 and S1.id - S3.id = 2 and S2.id - S3.id = 1)  -- S1, S2, S3
    or
    (S2.id - S1.id = 1 and S2.id - S3.id = 2 and S1.id - S3.id = 1) -- S2, S1, S3
    or
    (S3.id - S2.id = 1 and S2.id - S1.id =1 and S3.id - S1.id = 2) -- S3, S2, S1
)
ORDER BY S1.id