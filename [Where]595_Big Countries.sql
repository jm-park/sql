# [LeetCode] 595. Big Countries
# https://leetcode.com/problems/big-countries/solution/
# it has an area of bigger than 3 million square km or a population of more than 25 million.

SELECT name, population, area
FROM World
WHERE area > 3000000
OR population > 25000000
