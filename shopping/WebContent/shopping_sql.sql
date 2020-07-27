CREATE TABLE member (
   member_id      varchar2(15),
   member_pw       varchar2(13),
   member_name    varchar2(15),
   member_gender    varchar2(6),
   member_email    varchar2(30),
   member_phone   number,
   member_addr      varchar2(50),
   PRIMARY KEY (member_id)
)

CREATE TABLE item(
	item_num number,
	item_category varchar2(50),
	item_name varchar2(50),
	item_price number,
	item_description varchar2(2000),
	item_img varchar2(100),
	item_date date,
	primary key (item_num)
);

insert into item values(1, '모자', '밀짚모자', 12000, '질긴모자입니다', 'keep',sysdate);
insert into item values(2, '하의', '청바지', 1300, '질긴바지입니다', 'keep',sysdate);
insert into item values(3, '목걸이', '루비목걸이', 5000, '질긴목걸이입니다', 'keep',sysdate);
insert into item values(4, '상의', '반팔', 120000, '질긴반팔입니다', 'keep',sysdate);
insert into item values(5, '하의', '반바지', 99000, '바지입니다', 'keep',sysdate);

CREATE TABLE board(
	board_num number,
	board_name varchar2(20),
	board_subject varchar2(50),
	board_content varchar2(2000),
	board_re_ref number,
	board_re_lev number,
	board_re_seq number,
	board_readcount number,
	board_date date,
	primary key(board_num)
);

alter table board add constraint pk_board_name foreign key(board_name)
references member(member_id) ON DELETE CASCADE;


select * from item;
select * from board;

DROP TABLE item purge;
DROP TABLE board purge;
DROP TABLE member purge;