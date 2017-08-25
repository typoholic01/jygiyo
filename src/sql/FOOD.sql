CREATE TABLE JUGIYO_FOOD (
    SEQ_FOOD NUMBER(11) PRIMARY KEY,
    SEQ_STORE NUMBER(11) NOT NULL, 
    FOOD_CATEGORY VARCHAR2(100),
    FOOD_NAME VARCHAR2(100) NOT NULL,
    FOOD_PRICE NUMBER(11) NOT NULL,
    FOOD_SIZE VARCHAR2(100),
    IMG_URL VARCHAR2(100),
    STATUS VARCHAR2(100),
    CONSTRAINT FK_SEQ_STORE3 FOREIGN KEY(SEQ_STORE)
    REFERENCES JUGIYO_FOOD_STORE(SEQ_STORE)    
)


-- 테이블 삭제용
DROP TABLE JUGIYO_FOOD
CASCADE CONSTRAINTS;