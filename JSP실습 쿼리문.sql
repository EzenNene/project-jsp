-----------students----------------

drop table class_student;
drop table student;

create table student(
 id number primary key,
 username varchar2(20),
 univ varchar2(40),
 birth date,
 email varchar2(40)
);

create sequence id_seq
       increment by 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       

insert into student values(id_seq.nextval, '김길동', 'AA대학교', '1999-10-21', 'kim@aa.com');      
insert into student values(id_seq.nextval, '박사랑', 'BB대학교', '2000-01-21', 'park@bb.com'); 
insert into student values(id_seq.nextval, '나최고', 'CC대학교', '1998-07-11', 'na@cc.com'); 
insert into student values(id_seq.nextval, '김길동', 'BB대학교', '1999-03-10', 'kim@bb.com'); 
insert into student values(id_seq.nextval, '홍길동', 'AA대학교', '1999-12-10', 'hong@aa.com');

commit;

SELECT * FROM student;


-----------news----------------


drop table news;

create table news (
	aid number primary key,
	title varchar2(100) not null,
	img varchar2(100) not null,
	news_date date,
	content varchar2(255) not null
);

create sequence aid_seq
       increment by 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       
    
       