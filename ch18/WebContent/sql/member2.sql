select * from member;

select * from cols where table_name='MEMBER';

drop table member2;
create table member2 
      as select '                    ' id, name, passwd as password 
   from member 
where rownum=0;

select * from cols where table_name in ('MEMBER','MEMBER2');
select * from member2;