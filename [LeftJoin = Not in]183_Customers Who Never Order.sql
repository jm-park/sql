/*
# [LeetCode] 183. Customers Who Never Order
# https://leetcode.com/problems/customers-who-never-order/
# find all customers who never order anything.
*/
/* 내가 짠 SQL: 느림 1098 ms */
SELECT Name AS Customers
FROM Customers C LEFT JOIN Orders O ON C.Id = O.CustomerId
WHERE O.CustomerId IS NULL
;

/* Solution => 668 ms */
SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (SELECT DISTINCT CustomerId FROM Orders);