CREATE TABLE product(
	p_id varchar2(10) primary key,
	p_name varchar2(20),
	p_unitPrice  number,
	p_description varchar2(2000),
   	p_category varchar2(20),
	p_manufacturer varchar2(20),
	p_unitsInStock number,
	p_condition varchar2(20),
	p_fileName  varchar2(20)
)

desc product;