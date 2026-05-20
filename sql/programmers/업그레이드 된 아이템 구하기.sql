/*
오랜만에 도전한 첫 문제
문제의 구조를 파악하는 데에도 시간을 한참 썼고
구조를 파악했으나 그림이 잘 그려지지 않았음
펜과 노트를 꺼내 차근차근 필요한 게 뭔지부터 파악했고
안쪽에서부터 구현해냄 → 이중 서브 쿼리

절대 이게 효율적인 답은 아닐 것 같아서 다른 방법 탐색
서브 쿼리 그대로 JOIN으로 변경 가능한 형태
*/

/**SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO
WHERE ITEM_ID IN (
    SELECT ITEM_ID
    FROM ITEM_TREE
    WHERE PARENT_ITEM_ID IN (
        SELECT ITEM_ID
        FROM ITEM_INFO
        WHERE RARITY = "RARE"
    )
)
ORDER BY ITEM_ID DESC;**/

SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO I 
    JOIN ITEM_TREE T USING(ITEM_ID)
    JOIN ITEM_INFO INFO ON T.PARENT_ITEM_ID = INFO.ITEM_ID
WHERE INFO.RARITY = "RARE"
ORDER BY I.ITEM_ID DESC;
