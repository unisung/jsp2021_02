/* webMarketMember테이블 */
create table webMember ( 
    id varchar(15) primary key,
    password varchar(20) not null,
    name varchar(50) not null,
    gender varchar(4),
    birth  varchar(10), 
    mail  varchar(50),
    phone varchar(20),
    postcode varchar2(5),
    address varchar(100),
    addressDetail varchar2(100),
    addressJibun varchar2(150),
    addressExtra varchar2(100),
    regist_day varchar(50),
    profile blob
) 

select id,password,name,gender, birth, mail, phone, 
          postcode, address, addressDetail, addressJibun, addressExtra,
          regist_day
 from webMember;

 truncate table webMember;
 
 
create table imgTest(
id varchar2(10),
img blob
);

select img from imgTest;

select * from product;
