select   * from member2;
select  * from  MEMBERBOARD;


create table member2 (
	member_id       varchar2(15) ,
	member_pw      varchar2(13) ,
	member_name       varchar2(15) ,
	member_age     number ,
	member_gender     varchar2(6) ,
	member_email       varchar2(30) ,
	PRIMARY KEY (member_id )
);

create table memberboard (
	board_num       number ,
	board_id      varchar2(20) ,
	board_subject       varchar2(50) ,
	board_content     varchar2(2000) ,
	board_file       varchar2(50) ,
	board_re_ref      number ,
	board_re_lev      number ,
	board_re_seq     number ,
	board_readcount number,
	board_date        date ,
	PRIMARY KEY (board_num )
);




alter table memberboard add constraint pk_board_id foreign key(board_id)
references member2(member_id) ON DELETE CASCADE;


DROP TABLE member2 purge;
DROP TABLE memberboard purge;