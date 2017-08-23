CREATE TABLE JUGIYO_BBS (
    seq_bbs NUMBER(11) PRIMARY KEY,
    seq_store NUMBER(11) NOT NULL,
    comment_id VARCHAR2(100) NOT NULL,
    id_category VARCHAR2(100) NOT NULL,
    comments VARCHAR2(1000) NOT NULL,
    comments_group_no NUMBER(11) NOT NULL,
    comments_reply VARCHAR2(10) NOT NULL,
    img_url VARCHAR2(100),
    create_at DATE NOT NULL,
    update_at DATE NOT NULL,
    status VARCHAR2(100) NOT NULL,
    store_rating NUMBER(10),
    CONSTRAINT FK_SEQ_STORE2 FOREIGN KEY(SEQ_STORE)
    REFERENCES JUGIYO_FOOD_STORE(SEQ_STORE)
);

drop table JUGIYO_BBS

delete from JUGIYO_BBS

CREATE SEQUENCE SEQ_JUGIYO_BBS START WITH 1 INCREMENT BY 1;

-- 테스트 데이터
INSERT INTO JUGIYO_BBS(seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,comments_reply,img_url,create_at,update_at,status,store_rating)
VALUES(SEQ_JUGIYO_BBS.NEXTVAL,2,'123','BOSS','정말 맛있닭!',SEQ_JUGIYO_BBS.CURRVAL,' ',' ',SYSDATE,SYSDATE,'0','0');

INSERT INTO JUGIYO_BBS(SEQ_BBS, SEQ_STORE, COMMENT_ID, ID_CATEGORY, COMMENTS, COMMENTS_GROUP_NO, COMMENTS_REPLY, IMG_URL, CREATE_AT, UPDATE_AT, STATUS, STORE_RATING)  
VALUES(SEQ_JUGIYO_BBS.NEXTVAL, 2, '123', 'BOSS',  '끝내준닭!', SEQ_JUGIYO_BBS.CURRVAL, ' ', null,  SYSDATE, SYSDATE, '0', '0')

 SELECT seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,comments_reply,img_url,create_at,update_at,status,store_rating 
 FROM JUGIYO_BBS  
 ORDER BY comments_group_no desc,comments_reply asc 

SELECT comments_reply 
FROM JUGIYO_BBS 
WHERE comments_group_no = (
	SELECT comments_group_no FROM JUGIYO_BBS WHERE seq_bbs = 30
) 
ORDER BY comments_reply asc

UPDATE JUGIYO_BBS SET
 status = 'delete'
 WHERE seq_bbs = 69
 
SELECT * FROM
(
	SELECT seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,comments_reply,img_url,create_at,update_at,status,store_rating,
			ROW_NUMBER() OVER (ORDER BY comments_group_no desc,comments_reply asc) R
	FROM JUGIYO_BBS 
)	
WHERE seq_store = 26	
AND status = 'published' 
AND R BETWEEN 0 and 10 
ORDER BY comments_group_no desc,comments_reply asc 
