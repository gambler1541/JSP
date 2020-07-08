create table board_1(
	id number(10),
	name varchar2(20),
	passwd varchar2(20),
	title varchar2(100),
	email varchar2(30),
	regdate date,
	content varchar2(3000)
);

create sequence board_1_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 10000
	cycle

select * from board_1


ALTER TABLE board_1 ADD(addr varchar2(20));

UPDATE board_1 SET addr = 'SEOUL';

INSERT INTO board_1 values(board_1_seq.nextval,'choi','1234','초이','oo.naver.com',sysdate,'으악','seoul');

drop table board_1 purge;

insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');
insert into board_1 values(board_1_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악');


create sequence posts_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 10000
	cycle

create table posts(
	id number(10) primary key,
	name varchar2(20),
	passwd varchar2(20),
	title varchar2(20),
	email varchar2(20),
	regdate date,
	content varchar2(3000)
);

insert into posts values(posts_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악','seoul');
insert into posts values(posts_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악','seoul');
insert into posts values(posts_seq.nextval, 'choi', '1234', '초이입니다.','choi@gmail.com',sysdate,'으악','seoul');

select * from posts;

ALTER TABLE posts ADD(addr varchar2(20));

UPDATE posts SET addr = 'SEOUL';


