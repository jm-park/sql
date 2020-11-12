# [LeetCode] 627. Swap Salary
# https://leetcode.com/problems/swap-salary/
# 단 한줄로, 성별을 바꾸는 update 작성: a single update statement and no intermediate temp table.

UPDATE salary SET sex = (CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END);