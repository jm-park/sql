# [LeetCode] 175. Combine Two Tables
# https://leetcode.com/problems/combine-two-tables/
# each person in the Person table, regardless if there is an address for each of those people

SELECT FirstName, LastName, City, State
FROM Person LEFT JOIN Address ON Person.PersonId = Address.PersonId
;