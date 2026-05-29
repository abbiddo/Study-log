/*
셀프 조인 두 번까지 생각했다가 아직 그림이 잘 그려지지 않아
생각나는 대로 서브쿼리로 먼저 짜봤다.
구현해보니 보이는 WHERE절 조건!

서브쿼리 → 셀프 조인으로 리팩토링:
E1(최초) → E2(2세대) → E3(3세대) 순서로 JOIN
*/

/*SELECT ID
FROM ECOLI_DATA
WHERE PARENT_ID IN (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IN (
        SELECT ID
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL
    )
)
ORDER BY ID*/

SELECT E3.ID
FROM ECOLI_DATA E1 
    JOIN ECOLI_DATA E2 ON E1.ID = E2.PARENT_ID 
    JOIN ECOLI_DATA E3 ON E2.ID = E3.PARENT_ID
WHERE E1.PARENT_ID IS NULL
ORDER BY ID
    
