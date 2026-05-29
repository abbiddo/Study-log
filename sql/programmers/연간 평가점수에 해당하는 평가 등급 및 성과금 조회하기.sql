/* 
중복되는 AVG(SCORE) 을 사용할 것인지,
중복을 없애기 위해 FROM절에 서브쿼리를 사용할 것인지.

서브쿼리를 사용하더라도 CASE 부분은 필요해서
가독성 좋은 중복을 선택했다.

데이터 양이 많아지면 메모리나 시간도 고려해야겠지만
이런 간단한 문제에서는 가독성이 더 중요하다고 판단했다.
*/

SELECT EMP_NO, EMP_NAME, 
    CASE 
        WHEN AVG(SCORE) >= 96 THEN 'S'
        WHEN AVG(SCORE) >= 90 THEN 'A'
        WHEN AVG(SCORE) >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE, 
    CASE 
        WHEN AVG(SCORE) >= 96 THEN ROUND(SAL * 0.2)
        WHEN AVG(SCORE) >= 90 THEN ROUND(SAL * 0.15)
        WHEN AVG(SCORE) >= 80 THEN ROUND(SAL * 0.1)
        ELSE 0
    END AS BONUS
FROM HR_EMPLOYEES E JOIN HR_GRADE G USING(EMP_NO)
GROUP BY EMP_NO
ORDER BY EMP_NO
