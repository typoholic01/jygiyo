-- 테이블 생성
CREATE TABLE Foodstores(
    seqStore int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    userId VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    storeName VARCHAR(500) NOT NULL,
    description VARCHAR(4000) NOT NULL,
    address VARCHAR(4000) NOT NULL,
    imgURL VARCHAR(100),
    status VARCHAR(100) NOT NULL,
	PRIMARY KEY(seqStore),
	FOREIGN KEY(userId) REFERENCES Users(userId) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 조회용
SELECT * FROM JUGIYO_FOOD_STORES;

-- 테이블 삭제용
DROP TABLE IF EXISTS JUGIYO_FOOD_STORES CASCADE;

delete from JUGIYO_FOOD_STORE

CREATE SEQUENCE SEQ_JUGIYO_FOOD_STORE START WITH 1 INCREMENT BY 1;

--셀렉트 테스트
 SELECT SEQ_STORE, BOSS_ID, CATEGORY, TITLE, CONTENT, address, IMG_URL 
 FROM JUGIYO_FOOD_STORE 	
 WHERE BOSS_ID = '123'

SELECT SEQ_STORE, BOSS_ID, CATEGORY, TITLE, CONTENT, address, IMG_URL, status 
FROM JUGIYO_FOOD_STORE 	
WHERE status!='delete'
 
insert into JUGIYO_FOOD_STORE

UPDATE JUGIYO_FOOD_STORE SET
 address = ''
 WHERE address IS NULL

select * from JUGIYO_FOOD_STORE where first_name != 'Steven'

--칼럼 추가
alter table JUGIYO_FOOD_STORE add(status VARCHAR2(100));

-- 업데이트
update JUGIYO_FOOD_STORE 
set address = '광주 광산구 명도동 169'
where SEQ_STORE = 65;
