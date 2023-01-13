-- 초기화

DROP TABLE photographer;
DROP TABLE reserv;

drop sequence p_id_seq;
drop sequence r_id_seq;

COMMIT;

--------------------------------------------------------------------------------
-- 포토그래퍼 테이블
-- 작가고유번호, 이름, 이미지, 소개글, 폰번호, 이메일, 지역

CREATE TABLE photographer (
p_id NUMBER PRIMARY KEY,
p_name VARCHAR2(16) NOT NULL
);

INSERT INTO photographer values (p_id_SEQ.nextval , '홍길동');
INSERT INTO photographer values (p_id_SEQ.nextval , '이순신');
INSERT INTO photographer values (p_id_SEQ.nextval , '김철수');
INSERT INTO photographer values (p_id_SEQ.nextval , '강희재');

ALTER TABLE photographer add p_img VARCHAR2(4000);
ALTER TABLE photographer add p_intro VARCHAR2(400);
ALTER TABLE photographer add p_phone VARCHAR2(30);
ALTER TABLE photographer add p_email VARCHAR2(50);
ALTER TABLE photographer add p_loc VARCHAR2(16);

UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672239859305-6e3d40743d42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'
WHERE p_name = '홍길동';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672197339752-264445be6a45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'
WHERE p_name = '이순신';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672237608740-99d1a2404728?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
WHERE p_name = '김철수';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672185972350-0b54a4d3d7d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80'
WHERE p_name = '강희재';

UPDATE photographer SET p_intro = '안녕하세요 홍길동입니다'
WHERE p_name = '홍길동';
UPDATE photographer SET p_intro = '상업촬영 위주로 하는 이순신입니다'
WHERE p_name = '이순신';
UPDATE photographer SET p_intro = '웨딩촬영 전문 김철수입니다'
WHERE p_name = '김철수';
UPDATE photographer SET p_intro = '일상 스냅 작가 강희재입니다'
WHERE p_name = '강희재';

UPDATE photographer SET p_phone = '010-1111-1111'
WHERE p_name = '홍길동';
UPDATE photographer SET p_phone = '010-1111-2222'
WHERE p_name = '이순신';
UPDATE photographer SET p_phone = '010-1111-3333'
WHERE p_name = '김철수';
UPDATE photographer SET p_phone = '010-1111-4444'
WHERE p_name = '강희재';

UPDATE photographer SET p_email = 'hong@gmail.com'
WHERE p_name = '홍길동';
UPDATE photographer SET p_email = 'yee@gmail.com'
WHERE p_name = '이순신';
UPDATE photographer SET p_email = 'kim@gamil.com'
WHERE p_name = '김철수';
UPDATE photographer SET p_email = 'kang@gmail.com'
WHERE p_name = '강희재';

UPDATE photographer SET p_loc = '서울/경기'
WHERE p_name = '홍길동';
UPDATE photographer SET p_loc = '제주도'
WHERE p_name = '이순신';
UPDATE photographer SET p_loc = '강원도'
WHERE p_name = '김철수';
UPDATE photographer SET p_loc = '경기'
WHERE p_name = '강희재';


set define off;
--------------------------------------------------------------------------------
-- 모델 테이블

--CREATE TABLE model (
--m_no NUMBER PRIMARY KEY,
--m_name VARCHAR2(16),
--m_resdate NUMBER
--);
--
--INSERT INTO model VALUES (m_no_SEQ.nextval, '김모델', 1);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '이모델', 2);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '최모델', 3);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '강모델', 4);

--------------------------------------------------------------------------------
-- 예약(날짜) 테이블
-- 예약고유번호, 모델이름, 컨셉

CREATE TABLE reserv (

reserv_id NUMBER PRIMARY KEY,
m_name VARCHAR2(16) NOT NULL,
concept VARCHAR2(100) NOT NULL,

CONSTRAINT FK_P_ID FOREIGN KEY(p_id) REFERENCES photographer(p_id)
);

INSERT INTO RESERV VALUES (r_id_seq.nextval, '김모델', '010-1234-1111', 
TO_DATE('2022-12-29 10:00', 'YYYY-MM-DD HH24:MI'), '카페컨셉');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, '이모델', '010-1234-2222', 
TO_DATE('2022-12-29 12:00', 'YYYY-MM-DD HH24:MI'), '야외컨셉');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 1, '강모델', '010-1234-3333', 
TO_DATE('2022-12-29 14:00', 'YYYY-MM-DD HH24:MI'), '일상컨셉');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 3, '최모델', '010-1234-4444', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), '웨딩컨셉');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 4, '박모델', '010-1234-5555', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), '유아컨셉');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, '오모델', '010-1234-6666', 
TO_DATE('2022-12-29 18:00', 'YYYY-MM-DD HH24:MI'), '스트릿컨셉');

--------------------------------------------------------------------------------

select * from photographer;
select * from reserv;

commit;

--------------------------------------------------------------------------------








--------------------------------------------------------------------------------
--시퀀스

CREATE SEQUENCE p_id_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE r_id_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;







--------------------------------------------------------------------------------

SELECT 
        NVL(MIN( DECODE(TO_CHAR(dates,'D'),1, TO_CHAR(dates,'DD')  ) ),' ') 일
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),2, TO_CHAR(dates,'DD')  ) ),' ') 월
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),3, TO_CHAR(dates,'DD')  ) ),' ') 화
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),4, TO_CHAR(dates,'DD')  ) ),' ') 수
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),5, TO_CHAR(dates,'DD')  ) ),' ') 목
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),6, TO_CHAR(dates,'DD')  ) ),' ') 금
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),7, TO_CHAR(dates,'DD')  ) ),' ') 토
FROM(
    SELECT TO_DATE(:yyyymm,'YYYYMM') + (LEVEL -1) dates
    FROM dual
    CONNECT BY LEVEL <= EXTRACT(DAY FROM LAST_DAY(TO_DATE( :yyyymm ,'YYYYMM')))
) t
GROUP BY DECODE( TO_CHAR( dates, 'D'),1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') ) 
ORDER BY DECODE( TO_CHAR( dates,'D') ,1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') );