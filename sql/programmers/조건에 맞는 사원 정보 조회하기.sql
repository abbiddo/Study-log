/* 서브쿼리에서 구한 SCORE의 MAX값이 필요한 상태
WHERE절에서는 MAX값 사용이 안 됨
SCORE가 최대힌 행의 다른 데이터도 필요하여
WHERE절에서 서브쿼리를 한 번 더 해야하나 고민 했음
정렬 후 LIMIT 제한으로 해결
다만, 동점자가 있을 경우 불가능 */


SELECT SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_EMPLOYEES
    JOIN (
        SELECT EMP_NO, SUM(SCORE) AS SCORE
        FROM HR_GRADE
        WHERE YEAR = 2022
        GROUP BY EMP_NO
    ) S USING (EMP_NO)
ORDER BY SCORE DESC
LIMIT 1
