CREATE TABLE JUGIYO_FOOD_STORE(
    SEQ_STORE NUMBER(11) PRIMARY KEY,
    BOSS_ID VARCHAR2(100) NOT NULL,
    NAME VARCHAR2(100) NOT NULL,
    CATEGORY VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(500),
    CONTENT VARCHAR2(4000),
    address VARCHAR2(4000),
    IMG_URL VARCHAR2(100),
    CONSTRAINT FK_BOSS_ID FOREIGN KEY(BOSS_ID)
    REFERENCES JUGIYO_BOSS(BOSS_ID)
);

-- 테이블 삭제용
DROP TABLE JUGIYO_FOOD_STORE
CASCADE CONSTRAINTS;