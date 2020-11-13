# [LeetCode] 182. Duplicate Emails
# https://leetcode.com/problems/duplicate-emails/
# find all duplicate emails

SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1;