/* 
# [LeetCode] 178. Rank Scores
# https://leetcode.com/problems/rank-scores/
# 문제: rank scores
*/
-- 내 소스: 713 ms, faster than 5.58%
SELECT Score AS "Score",
        DENSE_RANK() OVER(ORDER BY score DESC) AS "Rank"
FROM Scores;
