-- ÃÊ±âÈ­

DROP TABLE photographer;
DROP TABLE reserv;

drop sequence p_id_seq;
drop sequence r_id_seq;

COMMIT;

--------------------------------------------------------------------------------
-- Æ÷Åä±×·¡ÆÛ Å×ÀÌºí

CREATE TABLE photographer (
p_id NUMBER PRIMARY KEY,
p_name VARCHAR2(16) NOT NULL
);

INSERT INTO photographer values (p_id_SEQ.nextval , 'È«±æµ¿');
INSERT INTO photographer values (p_id_SEQ.nextval , 'ÀÌ¼ø½Å');
INSERT INTO photographer values (p_id_SEQ.nextval , '±èÃ¶¼ö');
INSERT INTO photographer values (p_id_SEQ.nextval , '°­ÈñÀç');

ALTER TABLE photographer add p_img VARCHAR2(4000);
ALTER TABLE photographer add p_intro VARCHAR2(400);
ALTER TABLE photographer add p_phone VARCHAR2(30);
ALTER TABLE photographer add p_email VARCHAR2(50);
ALTER TABLE photographer add p_loc VARCHAR2(16);

UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672239859305-6e3d40743d42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'
WHERE p_name = 'È«±æµ¿';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672197339752-264445be6a45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'
WHERE p_name = 'ÀÌ¼ø½Å';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672237608740-99d1a2404728?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
WHERE p_name = '±èÃ¶¼ö';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672185972350-0b54a4d3d7d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80'
WHERE p_name = '°­ÈñÀç';

UPDATE photographer SET p_intro = '¾È³çÇÏ¼¼¿ä È«±æµ¿ÀÔ´Ï´Ù'
WHERE p_name = 'È«±æµ¿';
UPDATE photographer SET p_intro = '»ó¾÷ÃÔ¿µ À§ÁÖ·Î ÇÏ´Â ÀÌ¼ø½ÅÀÔ´Ï´Ù'
WHERE p_name = 'ÀÌ¼ø½Å';
UPDATE photographer SET p_intro = '¿þµùÃÔ¿µ Àü¹® ±èÃ¶¼öÀÔ´Ï´Ù'
WHERE p_name = '±èÃ¶¼ö';
UPDATE photographer SET p_intro = 'ÀÏ»ó ½º³À ÀÛ°¡ °­ÈñÀçÀÔ´Ï´Ù'
WHERE p_name = '°­ÈñÀç';

UPDATE photographer SET p_phone = '010-1111-1111'
WHERE p_name = 'È«±æµ¿';
UPDATE photographer SET p_phone = '010-1111-2222'
WHERE p_name = 'ÀÌ¼ø½Å';
UPDATE photographer SET p_phone = '010-1111-3333'
WHERE p_name = '±èÃ¶¼ö';
UPDATE photographer SET p_phone = '010-1111-4444'
WHERE p_name = '°­ÈñÀç';

UPDATE photographer SET p_email = 'hong@gmail.com'
WHERE p_name = 'È«±æµ¿';
UPDATE photographer SET p_email = 'yee@gmail.com'
WHERE p_name = 'ÀÌ¼ø½Å';
UPDATE photographer SET p_email = 'kim@gamil.com'
WHERE p_name = '±èÃ¶¼ö';
UPDATE photographer SET p_email = 'kang@gmail.com'
WHERE p_name = '°­ÈñÀç';

UPDATE photographer SET p_loc = '¼­¿ï/°æ±â'
WHERE p_name = 'È«±æµ¿';
UPDATE photographer SET p_loc = 'Á¦ÁÖµµ'
WHERE p_name = 'ÀÌ¼ø½Å';
UPDATE photographer SET p_loc = '°­¿øµµ'
WHERE p_name = '±èÃ¶¼ö';
UPDATE photographer SET p_loc = '°æ±â'
WHERE p_name = '°­ÈñÀç';


set define off;
--------------------------------------------------------------------------------
-- ¸ðµ¨ Å×ÀÌºí

--CREATE TABLE model (
--m_no NUMBER PRIMARY KEY,
--m_name VARCHAR2(16),
--m_resdate NUMBER
--);
--
--INSERT INTO model VALUES (m_no_SEQ.nextval, '±è¸ðµ¨', 1);
--INSERT INTO model VALUES (m_no_SEQ.nextval, 'ÀÌ¸ðµ¨', 2);
--INSERT INTO model VALUES (m_no_SEQ.nextval, 'ÃÖ¸ðµ¨', 3);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '°­¸ðµ¨', 4);

--------------------------------------------------------------------------------
-- ¿¹¾à(³¯Â¥) Å×ÀÌºí

CREATE TABLE reserv (

reserv_id NUMBER PRIMARY KEY,
p_id NUMBER NOT NULL,
m_name VARCHAR2(16) NOT NULL,
m_number VARCHAR2 (50) NOT NULL,
reserv_date DATE NOT NULL,
concept VARCHAR2(100) NOT NULL,

CONSTRAINT FK_P_ID FOREIGN KEY(p_id) REFERENCES photographer(p_id)
);

INSERT INTO RESERV VALUES (r_id_seq.nextval, 1, '±è¸ðµ¨', '010-1234-1111', 
TO_DATE('2022-12-29 10:00', 'YYYY-MM-DD HH24:MI'), 'Ä«ÆäÄÁ¼Á');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, 'ÀÌ¸ðµ¨', '010-1234-2222', 
TO_DATE('2022-12-29 12:00', 'YYYY-MM-DD HH24:MI'), '¾ß¿ÜÄÁ¼Á');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 1, '°­¸ðµ¨', '010-1234-3333', 
TO_DATE('2022-12-29 14:00', 'YYYY-MM-DD HH24:MI'), 'ÀÏ»óÄÁ¼Á');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 3, 'ÃÖ¸ðµ¨', '010-1234-4444', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), '¿þµùÄÁ¼Á');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 4, '¹Ú¸ðµ¨', '010-1234-5555', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), 'À¯¾ÆÄÁ¼Á');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, '¿À¸ðµ¨', '010-1234-6666', 
TO_DATE('2022-12-29 18:00', 'YYYY-MM-DD HH24:MI'), '½ºÆ®¸´ÄÁ¼Á');

--------------------------------------------------------------------------------

select * from photographer;
select * from reserv;

commit;

--------------------------------------------------------------------------------








--------------------------------------------------------------------------------
--½ÃÄö½º

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
        NVL(MIN( DECODE(TO_CHAR(dates,'D'),1, TO_CHAR(dates,'DD')  ) ),' ') ÀÏ
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),2, TO_CHAR(dates,'DD')  ) ),' ') ¿ù
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),3, TO_CHAR(dates,'DD')  ) ),' ') È­
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),4, TO_CHAR(dates,'DD')  ) ),' ') ¼ö
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),5, TO_CHAR(dates,'DD')  ) ),' ') ¸ñ
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),6, TO_CHAR(dates,'DD')  ) ),' ') ±Ý
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),7, TO_CHAR(dates,'DD')  ) ),' ') Åä
FROM(
    SELECT TO_DATE(:yyyymm,'YYYYMM') + (LEVEL -1) dates
    FROM dual
    CONNECT BY LEVEL <= EXTRACT(DAY FROM LAST_DAY(TO_DATE( :yyyymm ,'YYYYMM')))
) t
GROUP BY DECODE( TO_CHAR( dates, 'D'),1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') ) 
ORDER BY DECODE( TO_CHAR( dates,'D') ,1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') );