# [LetCode] 620. Not Boring Movies
# https://leetcode.com/problems/not-boring-movies/
# 홀수 ID AND not 'boring', Order the result by rating.

SELECT * FROM cinema
WHERE MOD(id,2) = 1
AND description NOT LIKE '%boring%'
ORDER BY rating DESC;