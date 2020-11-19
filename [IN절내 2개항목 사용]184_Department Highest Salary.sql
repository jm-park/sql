/*
# [LeetCode] 184. Department Highest Salary
# https://leetcode.com/problems/department-highest-salary/
# find employees who have the highest salary in each of the departments. 
*/
-- 내소스: 884 ms (faster than 66.90%)
SELECT D.Name AS Department, E.Name AS Employee, E.Salary AS Salary
FROM Employee E, Department D,
(SELECT MAX(Salary) AS Salary, DepartmentId FROM Employee GROUP BY DepartmentId) EMax
WHERE E.DepartmentId = D.Id
AND D.Id = EMax.DepartmentId
AND E.Salary = EMax.Salary
;

-- in절을 2개의 항목이 쌍으로 합친경우가 가능하다!!!!!!
-- Solution: 737 ms ( faster than 19.74%)
SELECT
    Department.name AS Department,
    Employee.name AS Employee,
    Salary
FROM
    Employee
        JOIN
    Department ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
	)
;