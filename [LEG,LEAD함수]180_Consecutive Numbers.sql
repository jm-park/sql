/* 
# [LeetCode] 180. Consecutive Numbers
# https://leetcode.com/problems/consecutive-numbers/
# find all numbers that appear at least three times consecutively (연속적으로).

CF) 
1. LAG, LEAD, PARTITION BY 함수
    https://gent.tistory.com/339
2. 유사한 내용에 대한 해설 (연속5일 결석한 인원 파악하기)
    http://www.gurubee.net/lecture/2908
*/
-- 내소스: 599 ms ( faster than 98.38% )
SELECT DISTINCT Num AS ConsecutiveNums
FROM 
( SELECT Id
        , Num
        , LAG(Num) OVER(ORDER BY Id) AS PREV_num
        , LEAD(Num) OVER(ORDER BY Id) AS NEXT_num
 FROM Logs
) LogCNT
WHERE PREV_num = NEXT_num 
AND NEXT_num = Num -- AND PREV_num = Num
;


-- solution by MySQL
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;