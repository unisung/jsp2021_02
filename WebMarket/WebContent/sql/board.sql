create table board(
num number primary key, /* 게시글 순번 */
id varchar2(30) not null, /* 회원 아이디 */
name varchar2(30) not null, /* 회원 명*/
subject varchar2(100) not null,/* 게시글 제목*/
content varchar2(2000) not null,/* 게시글 내용 */
register_day varchar2(30),/* 게시글 등록 일자*/
hit number default 0,/*게시글 조회 수 */
ip varchar2(30)/* 게시글 등록시 ip */
);

/* 게시글 용 sequence */
create sequence board_seq start with 1 increment by 1;


select 'private '|| decode(data_type,'NUMBER','int','VARCHAR2','String',data_type),lower(column_name)
  from cols 
where table_name='BOARD'
 order by column_id
 ;

insert into board(num, id, name, subject, content, register_day, ip)
values (board_seq.nextval, 'hong','홍길동','게시글 제목'||board_seq.currval, '게시글 내용'||board_seq.currval,to_char(sysdate),'127.0.0.1')
 
select * from board;


select * from board where subject like '%제목%' order by num desc;

select * from board where "+items+" like '%"+text+"%' order by num desc



select  rn, num, id,name,subject, content, register_day, hit, ip
 from
 (
select rownum rn, num, id,name,subject, content, register_day, hit, ip
  from 
(select board.* from board where subject like '%제목%' order by num desc)
 ) 
where rn>=11 and rn<=20
 ;






 