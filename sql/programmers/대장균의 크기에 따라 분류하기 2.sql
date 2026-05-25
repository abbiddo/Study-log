/*
상대적인 기준으로 데이터를 구분해야 해서 구간을 어떻게 나눌지 고민했다.
찾아보면서 NTILE 함수를 다시 확인했다.

SQLD 공부 때 개념은 봤지만 직접 사용해본 적이 없어 구문이 바로 떠오르지 않았다.

이론만 보는 것보다 직접 써보는 연습이 중요하다는 걸 다시 느꼈다.

NTILE(N) OVER (ORDER BY 컬럼) → 전체를 N등분해서 순위 부여
*/

SELECT ID,
    CASE NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC)
        WHEN 1 THEN 'CRITICAL'
        WHEN 2 THEN 'HIGH'
        WHEN 3 THEN 'MEDIUM'
        WHEN 4 THEN 'LOW'
    END AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID
