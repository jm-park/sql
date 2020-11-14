# [LeetCode] 176. Second Highest Salary
# https://leetcode.com/problems/second-highest-salary/
# get the second highest salary. If there is no second highest salary, then the query should return null.

SELECT
    CASE WHEN COUNT(*) > 1 THEN MIN(Salary)
        ELSE null END AS SecondHighestSalary
FROM (SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 2) emp
ORDER BY Salary DESC
;

# 답안: OFFSET=> 몇번째 row부터 출력할 지
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary
;