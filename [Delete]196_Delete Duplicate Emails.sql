# [LeetCode] 196. Delete Duplicate Emails
# https://leetcode.com/problems/delete-duplicate-emails/
#  delete all duplicate email entries, keeping only unique emails based on its smallest Id.
  
# 내 소스 : 1505 ms
# 
# 에러발생 : "You can't specify target table 테이블명 for update in FROM clause"
# 참고) https://jmkjb.tistory.com/entry/MySQLUpdateError

DELETE FROM Person 
WHERE Id NOT IN (
    SELECT ID 
    FROM (SELECT MIN(Id) ID
            FROM Person
          GROUP BY Email) AS TMP)
          
          
# Solution: 	1720 ms
DELETE p1 FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id