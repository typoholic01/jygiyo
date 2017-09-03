-- 테이블 생성
CREATE TABLE JUGIYO_comments (
    seqBbs INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    seqStore INT(11) UNSIGNED NOT NULL,
    commentsId VARCHAR(100) NOT NULL,
    idCategory VARCHAR(100) NOT NULL,
    comments VARCHAR(1000) NOT NULL,
    commentsGroupNo INT(11) NOT NULL,
    commentsReply VARCHAR(10) NOT NULL,
    imgURL VARCHAR(100),
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(100) NOT NULL,
    storeRating INT(10),
	PRIMARY KEY(seqBbs),
	FOREIGN KEY(seqStore) REFERENCES JUGIYO_FOOD_STORES(seqStore) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

보스오더
푸드스토어리스트
쇼핑 파이널
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
 
SELECT * FROM JUGIYO_BBS
(
	SELECT seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,comments_reply,img_url,create_at,update_at,status,store_rating,
			ROW_NUMBER() OVER (ORDER BY comments_group_no desc,comments_reply asc) R
	FROM JUGIYO_BBS 
)	
WHERE status = 'published' 
AND R BETWEEN 0 and 10 

SELECT COUNT(seq_bbs) FROM JUGIYO_BBS WHERE seq_store = 26

SELECT * FROM (		
 	SELECT seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,				
 	comments_reply,img_url,create_at,update_at,status,store_rating,				
 	ROW_NUMBER() OVER (ORDER BY comments_group_no desc,comments_reply asc) R		
 	FROM JUGIYO_BBS  
 	WHERE status = 'published'
 	AND seq_store = 41
)	 
WHERE R BETWEEN 0 and 10 

SELECT * FROM JUGIYO_BBS