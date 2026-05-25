/*
문제 자체가 어렵진 않았으나 또 서브쿼리부터 생각났다.
서브쿼리만이 답은 아닐 것 같아서 다른 방법도 모색
셀프조인은 다른 조인보다도 구조 파악이 잘 안그려진다
아직은 천천히 직접 그려보는 게 이해가 빠르다
*/

/* SELECT ID, COALESCE(C, 0)
FROM ECOLI_DATA E1 LEFT OUTER JOIN (
    SELECT PARENT_ID, COUNT(*) AS C
    FROM ECOLI_DATA
    GROUP BY PARENT_ID
) E2 ON E1.ID = E2.PARENT_ID */

SELECT E1.ID, COUNT(E2.PARENT_ID)
FROM ECOLI_DATA E1 LEFT OUTER JOIN ECOLI_DATA E2
    ON E1.ID = E2.PARENT_ID
GROUP BY E1.ID
ORDER BY E1.ID
