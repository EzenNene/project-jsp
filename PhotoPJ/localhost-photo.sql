-- �ʱ�ȭ

DROP TABLE photographer;
DROP TABLE model;
DROP TABLE calendar;

drop sequence p_no_seq;
drop sequence m_no_seq;

--------------------------------------------------------------------------------
-- ����׷��� ���̺�

CREATE TABLE photographer (
p_no NUMBER PRIMARY KEY,
p_name VARCHAR2(16),
p_resdate NUMBER
);

INSERT INTO photographer values (p_no_SEQ.nextval , 'ȫ�浿', 1);
INSERT INTO photographer values (p_no_SEQ.nextval , '�̼���', 2);
INSERT INTO photographer values (p_no_SEQ.nextval , '��ö��', 3);
INSERT INTO photographer values (p_no_SEQ.nextval , '������', 4);

--------------------------------------------------------------------------------
-- �� ���̺�

CREATE TABLE model (
m_no NUMBER PRIMARY KEY,
m_name VARCHAR2(16),
m_resdate NUMBER
);

INSERT INTO model VALUES (m_no_SEQ.nextval, '���', 1);
INSERT INTO model VALUES (m_no_SEQ.nextval, '�̸�', 2);
INSERT INTO model VALUES (m_no_SEQ.nextval, '�ָ�', 3);
INSERT INTO model VALUES (m_no_SEQ.nextval, '����', 4);

--------------------------------------------------------------------------------
-- ����(��¥) ���̺�

CREATE TABLE CALENDAR (
c_date NUMBER PRIMARY KEY,

p_no NUMBER,
m_no NUMBER,
resdate NUMBER

);

INSERT INTO calendar VALUES (1);


--------------------------------------------------------------------------------
--������

CREATE SEQUENCE p_no_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE m_no_SEQ
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