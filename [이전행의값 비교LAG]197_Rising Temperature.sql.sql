/* 
# [LeetCode] 197. Rising Temperature
# https://leetcode.com/problems/rising-temperature/
# find all dates' id with higher temperature compared to its previous dates (yesterday)
*/

-- 내소스: 700 ms
SELECT id 
FROM 
(
    SELECT id, recordDate, Temperature,
            LAG(recordDate) OVER(ORDER BY recordDate) AS PREV_DATE,
            LAG(Temperature) OVER(ORDER BY recordDate) AS yesterday_Temperature
    FROM Weather
) W
WHERE yesterday_Temperature < Temperature
AND recordDate - PREV_DATE = 1


-- Solution 1796 ms
SELECT Weather.id
FROM Weather JOIN Weather W 
    ON TO_DATE(Weather.recordDate, 'YYYY-MM-DD') - TO_DATE(W.recordDate, 'YYYY-MM-DD') = 1
        AND Weather.Temperature > W.Temperature

-- Solution 응용 버전 2598 ms
SELECT W1.id
FROM Weather W1, Weather W2
WHERE TO_DATE(W1.recordDate, 'YYYY-MM-DD') - TO_DATE(W2.recordDate, 'YYYY-MM-DD') = 1 
AND W1.Temperature > W2.Temperature