create table member(
id number primary key,
name varchar2(100) not null,
passwd varchar2(50) not null
);

select * from member;

create table product(
p_id varchar2(10) primary key,
p_name varchar2(50) not null,
p_unitprice number,
p_description varchar2(2000),
p_category varchar2(50),
p_manufacturer varchar2(100),
p_unitsInstock number,
p_condition varchar2(50),
p_fileName varchar2(100)
);

insert into prodcut values(?,?,?,?,?,?,?,?,?);

select * from PRODUCT;