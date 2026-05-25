/*
공부 시작한 첫 날 도전했다가 포기한 문제.

일주일정도 낮은 난이도부터 접근하니 해결했다.

처음에는 서브쿼리 + JOIN 여러 개로 접근했는데,
구조가 복잡해지는 느낌이 들었다.

고민 끝에 WHERE 절로 서브쿼리를 옮겼고,
튜플 형태로도 IN 사용이 가능하다는 점이 떠올랐다.

불필요한 JOIN을 제거하니 쿼리도 더 깔끔해지고 실행 속도도 개선됐다.
*/

/*SELECT ID, FISH_NAME, LEN
FROM FISH_INFO LEFT OUTER JOIN (
    SELECT FISH_TYPE, MAX(LENGTH) LEN
    FROM FISH_INFO
    GROUP BY FISH_TYPE    
) I2 USING(FISH_TYPE) LEFT OUTER JOIN FISH_NAME_INFO USING (FISH_TYPE)
WHERE LENGTH = LEN*/

SELECT ID, FISH_NAME, LENGTH
FROM FISH_INFO JOIN FISH_NAME_INFO USING (FISH_TYPE)
WHERE (FISH_TYPE, LENGTH) IN (
    SELECT FISH_TYPE, MAX(LENGTH)
    FROM FISH_INFO
    GROUP BY FISH_TYPE
)
ORDER BY ID
