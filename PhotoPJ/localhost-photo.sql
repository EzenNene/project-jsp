-- �ʱ�ȭ

DROP TABLE photographer;
DROP TABLE reserv;

drop sequence p_id_seq;
drop sequence r_id_seq;

--------------------------------------------------------------------------------
-- ����׷��� ���̺�

CREATE TABLE photographer (
p_id NUMBER PRIMARY KEY,
p_name VARCHAR2(16) NOT NULL
);

INSERT INTO photographer values (p_id_SEQ.nextval , 'ȫ�浿');
INSERT INTO photographer values (p_id_SEQ.nextval , '�̼���');
INSERT INTO photographer values (p_id_SEQ.nextval , '��ö��');
INSERT INTO photographer values (p_id_SEQ.nextval , '������');

--------------------------------------------------------------------------------
-- �� ���̺�

--CREATE TABLE model (
--m_no NUMBER PRIMARY KEY,
--m_name VARCHAR2(16),
--m_resdate NUMBER
--);
--
--INSERT INTO model VALUES (m_no_SEQ.nextval, '���', 1);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '�̸�', 2);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '�ָ�', 3);
--INSERT INTO model VALUES (m_no_SEQ.nextval, '����', 4);

--------------------------------------------------------------------------------
-- ����(��¥) ���̺�

CREATE TABLE reserv (

reserv_id NUMBER PRIMARY KEY,
p_id NUMBER NOT NULL,
m_name VARCHAR2(16) NOT NULL,
m_number VARCHAR2 (50) NOT NULL,
reserv_date DATE NOT NULL,
concept VARCHAR2(100) NOT NULL,

CONSTRAINT FK_P_ID FOREIGN KEY(p_id) REFERENCES photographer(p_id)
);

INSERT INTO RESERV VALUES (r_id_seq.nextval, 1, '���', '010-1234-1111', 
TO_DATE('2022-12-29 10:00', 'YYYY-MM-DD HH24:MI'), 'ī������');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, '�̸�', '010-1234-2222', 
TO_DATE('2022-12-29 12:00', 'YYYY-MM-DD HH24:MI'), '�߿�����');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 1, '����', '010-1234-3333', 
TO_DATE('2022-12-29 14:00', 'YYYY-MM-DD HH24:MI'), '�ϻ�����');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 3, '�ָ�', '010-1234-4444', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), '��������');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 4, '�ڸ�', '010-1234-5555', 
TO_DATE('2022-12-29 16:00', 'YYYY-MM-DD HH24:MI'), '��������');
INSERT INTO RESERV VALUES (r_id_seq.nextval, 2, '����', '010-1234-6666', 
TO_DATE('2022-12-29 18:00', 'YYYY-MM-DD HH24:MI'), '��Ʈ������');

--------------------------------------------------------------------------------

select * from photographer;
select * from reserv;
commit;

--------------------------------------------------------------------------------








--------------------------------------------------------------------------------
--������

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
        NVL(MIN( DECODE(TO_CHAR(dates,'D'),1, TO_CHAR(dates,'DD')  ) ),' ') ��
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),2, TO_CHAR(dates,'DD')  ) ),' ') ��
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),3, TO_CHAR(dates,'DD')  ) ),' ') ȭ
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),4, TO_CHAR(dates,'DD')  ) ),' ') ��
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),5, TO_CHAR(dates,'DD')  ) ),' ') ��
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),6, TO_CHAR(dates,'DD')  ) ),' ') ��
        ,NVL(MIN(DECODE(TO_CHAR(dates,'D'),7, TO_CHAR(dates,'DD')  ) ),' ') ��
FROM(
    SELECT TO_DATE(:yyyymm,'YYYYMM') + (LEVEL -1) dates
    FROM dual
    CONNECT BY LEVEL <= EXTRACT(DAY FROM LAST_DAY(TO_DATE( :yyyymm ,'YYYYMM')))
) t
GROUP BY DECODE( TO_CHAR( dates, 'D'),1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') ) 
ORDER BY DECODE( TO_CHAR( dates,'D') ,1, TO_CHAR( dates, 'IW')+1, TO_CHAR( dates, 'IW') );