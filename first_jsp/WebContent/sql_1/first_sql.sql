select * from emp;

create table student(
	id varchar2(20) NOT NULL ,
	passwd varchar2(20) NOT NULL ,
	name varchar2(20) NOT NULL ,
	year number(4)  NULL ,
	snum varchar2(10)  NULL ,
	depart varchar2(30) NULL ,
	mobile1 char(3) NULL ,
	mobile2 varchar2(15) NULL ,
	address varchar2(65) NULL ,
	email varchar2(30) NULL ,
	PRIMARY KEY(id)
		
);

drop table student purge;

select * from student;

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
values ('javajsp', 'java8394', '고유탁', 2010, '1077818', '컴퓨터공학과', '011', '7649-9875', '서울시', 'java2@gmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
values ('gonji', 'young', '김기우', 2009, '2065787', '컴퓨터공학과', '016', '2975-9854', '인천시', 'gong@hotmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
values ('water', 'javayoung', '김남혁', 2010, '1176432', '인터넷비즈니스과', '011', '5531-6677', '서울시', 'singer@gmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
values ('novel', 'elephant', '김민준', 2011, '2056485', '기술경영과', '016', '3487-9919', '부산시', 'novel@hanmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
values ('korea', '9943inner', '김본규', 2010, '1987372', '컴퓨터공학과', '017', '2670-4593', '천안시', 'wing@gmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email)
values ('busan', '92join', '박명배', 2011, '2047857', '컴퓨터공학과' , '017', '1425-7852', '부산시', 'oracle@gmail.com');

insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email)
values ('northkorea', 'choi', '최우석', 2008, '2054857', '수학과' , '010', '2232-7852', '평양시', 'noko@gmail.com');