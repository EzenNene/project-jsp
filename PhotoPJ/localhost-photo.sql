-- �ʱ�ȭ

DROP TABLE photographer;
DROP TABLE reserv;

drop sequence p_id_seq;
drop sequence r_id_seq;

COMMIT;

--------------------------------------------------------------------------------
-- ����׷��� ���̺�
-- �۰�������ȣ, �̸�, �̹���, �Ұ���, ����ȣ, �̸���, ����

CREATE TABLE photographer (
p_id NUMBER PRIMARY KEY,
p_name VARCHAR2(16) NOT NULL
);

INSERT INTO photographer values (p_id_SEQ.nextval , 'ȫ�浿');
INSERT INTO photographer values (p_id_SEQ.nextval , '�̼���');
INSERT INTO photographer values (p_id_SEQ.nextval , '��ö��');
INSERT INTO photographer values (p_id_SEQ.nextval , '������');

ALTER TABLE photographer add p_img VARCHAR2(4000);
ALTER TABLE photographer add p_intro VARCHAR2(400);
ALTER TABLE photographer add p_phone VARCHAR2(30);
ALTER TABLE photographer add p_email VARCHAR2(50);
ALTER TABLE photographer add p_loc VARCHAR2(16);

UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672239859305-6e3d40743d42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'
WHERE p_name = 'ȫ�浿';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672197339752-264445be6a45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'
WHERE p_name = '�̼���';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672237608740-99d1a2404728?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
WHERE p_name = '��ö��';
UPDATE photographer SET p_img = 'https://images.unsplash.com/photo-1672185972350-0b54a4d3d7d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80'
WHERE p_name = '������';

UPDATE photographer SET p_intro = '�ȳ��ϼ��� ȫ�浿�Դϴ�'
WHERE p_name = 'ȫ�浿';
UPDATE photographer SET p_intro = '����Կ� ���ַ� �ϴ� �̼����Դϴ�'
WHERE p_name = '�̼���';
UPDATE photographer SET p_intro = '�����Կ� ���� ��ö���Դϴ�'
WHERE p_name = '��ö��';
UPDATE photographer SET p_intro = '�ϻ� ���� �۰� �������Դϴ�'
WHERE p_name = '������';

UPDATE photographer SET p_phone = '010-1111-1111'
WHERE p_name = 'ȫ�浿';
UPDATE photographer SET p_phone = '010-1111-2222'
WHERE p_name = '�̼���';
UPDATE photographer SET p_phone = '010-1111-3333'
WHERE p_name = '��ö��';
UPDATE photographer SET p_phone = '010-1111-4444'
WHERE p_name = '������';

UPDATE photographer SET p_email = 'hong@gmail.com'
WHERE p_name = 'ȫ�浿';
UPDATE photographer SET p_email = 'yee@gmail.com'
WHERE p_name = '�̼���';
UPDATE photographer SET p_email = 'kim@gamil.com'
WHERE p_name = '��ö��';
UPDATE photographer SET p_email = 'kang@gmail.com'
WHERE p_name = '������';

UPDATE photographer SET p_loc = '����/���'
WHERE p_name = 'ȫ�浿';
UPDATE photographer SET p_loc = '���ֵ�'
WHERE p_name = '�̼���';
UPDATE photographer SET p_loc = '������'
WHERE p_name = '��ö��';
UPDATE photographer SET p_loc = '���'
WHERE p_name = '������';


set define off;
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
-- ���������ȣ, ���̸�, ����

CREATE TABLE reserv (

reserv_id NUMBER PRIMARY KEY,
m_name VARCHAR2(16) NOT NULL,
concept VARCHAR2(100) NOT NULL,
p_id NUMBER,

CONSTRAINT FK_P_ID FOREIGN KEY(p_id) REFERENCES photographer(p_id)
);

INSERT INTO RESERV VALUES (r_id_seq.nextval, '���', 'ī������', 1);
INSERT INTO RESERV VALUES (r_id_seq.nextval, '�̸�', '�߿�����', 2);
INSERT INTO RESERV VALUES (r_id_seq.nextval, '����', '�ϻ�����', 3);
INSERT INTO RESERV VALUES (r_id_seq.nextval, '�ָ�', '��������', 4);
INSERT INTO RESERV VALUES (r_id_seq.nextval, '�ڸ�', '��������', 1);
INSERT INTO RESERV VALUES (r_id_seq.nextval, '����','��Ʈ������', 2);

--------------------------------------------------------------------------------

select * from photographer;
select * from reserv;

commit;

--------------------------------------------------------------------------------

select * from reserv where p_id=1;
select reserv_id, m_name, concept from reserv where p_id=1 order by reserv_id;





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