SELECT V.v_name, '19'||SUBSTR(V.v_jumin,1,2)||'��'||SUBSTR(V.v_jumin,3,2)||'��'||SUBSTR(V.v_jumin,5,2)||'��',
'�� '||(TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-TO_NUMBER('19'||SUBSTR(V.v_jumin,1,2)))||'��', DECODE((SUBSTR(V.v_jumin,7,1)), '1', '��', '2', '��')v_jumin,
			M.m_no, SUBSTR(V.v_time, 1, 2)||':'||SUBSTR(V.v_time,3,4), V.v_confirm
				 FROM tbl_vote_202005 V, tbl_member_202005 M where V.m_no = M.m_no;
                 
                SELECT M.m_no, M.m_name, COUNT(V.m_no)
                FROM tbl_member_202005 M, tbl_vote_202005 V
                where M.m_no = V.m_no
                GROUP BY M.m_no ,M.m_name
                ORDER BY COUNT(V.m_no) DESC;
                
                
                
                
--------------------------------------------------------------------------------                
                
drop table tbl_jumin_201808;
                
create table tbl_jumin_201808(
jumin char(14) primary key,
pname varchar2(16),
tel varchar2(13),
address varchar2(10)
);

insert into tbl_jumin_201808 values ('700101-1000001', '���ֹ�', '010-1234-0001', '����');
insert into tbl_jumin_201808 values ('700101-2000002', '���ֹ�', '010-1234-0002', '����');
insert into tbl_jumin_201808 values ('700101-1000003', '���ֹ�', '010-1234-0003', '����');
insert into tbl_jumin_201808 values ('700101-2000004', '���ֹ�', '010-1234-0004', '����');
insert into tbl_jumin_201808 values ('700101-1000005', 'ȫ�ֹ�', '010-1234-0005', '����');
insert into tbl_jumin_201808 values ('700101-2000006', '���ֹ�', '010-1234-0006', '�뱸');
insert into tbl_jumin_201808 values ('700101-1000007', 'Ȳ�ֹ�', '010-1234-0007', '�뱸');
insert into tbl_jumin_201808 values ('700101-2000008', '���ֹ�', '010-1234-0008', '����');
insert into tbl_jumin_201808 values ('700101-1000009', '���ֹ�', '010-1234-0009', '����');
insert into tbl_jumin_201808 values ('700101-2000010', '���ֹ�', '010-1234-0010', '����');

select * from tbl_jumin_201808;

create table tbl_hosp_202108(
hospcode char(4) primary key,
hospname varchar2 (10),
hosptel varchar2 (10),
hospaddr varchar2 (10)
);

insert into tbl_hosp_202108 values ('H001', '��-����', '1588-0001', '����');
insert into tbl_hosp_202108 values ('H002', '��-����', '1588-0002', '����');
insert into tbl_hosp_202108 values ('H003', '��-����', '1588-0003', '�뱸');
insert into tbl_hosp_202108 values ('H004', '��-����', '1588-0004', '����');

select * from tbl_hosp_202108;

create table tbl_vaccresv_202108 (
resvno char(8) primary key,
jumin char(14),
vcode char(4),
hospcode char(4),
resvdate char(8),
resvtime char(4)
);

insert into tbl_vaccresv_202108 values ('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920'); 
insert into tbl_vaccresv_202108 values ('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
insert into tbl_vaccresv_202108 values ('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
insert into tbl_vaccresv_202108 values ('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
insert into tbl_vaccresv_202108 values ('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
insert into tbl_vaccresv_202108 values ('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
insert into tbl_vaccresv_202108 values ('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
insert into tbl_vaccresv_202108 values ('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
insert into tbl_vaccresv_202108 values ('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
insert into tbl_vaccresv_202108 values ('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');

select * from tbl_vaccresv_202108;
