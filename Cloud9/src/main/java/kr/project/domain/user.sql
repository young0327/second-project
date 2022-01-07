create table tsboard( 
bidx int not null auto_increment,
nick varchar(10),
title varchar(20),
content varchar(300),
category varchar (10),
day date,
primary key(bidx)
);


insert into userinfo values('test1','1234','test1')

select * from userinfo
delete from userinfo where nick = ""
desc tsboard
select * from tsboard
drop table tsboard

insert into tsboard values('test','test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('hero','test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('new','test01','테스트입니다.','테스트다아아앙','category0',now())
       select * from tsboard where category like '%category%'

