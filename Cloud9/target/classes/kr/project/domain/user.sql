create table tsboard( 
bidx int not null auto_increment,
nick varchar(10),
title varchar(20),
content varchar(300),
category varchar (10),
day date,
primary key(bidx)
);

create table userinfo(
id varchar(10),
pwd varchar(10),
nick varchar(10),
primary key (id)
);

insert into tsboard(nick, title, content, category, day) values('test01','테스트입니다.','테스트다아아앙','category0',now())


insert into userinfo values('test1','1234','test1')

select * from userinfo
delete from tsboard where bidx = '14'
desc tsboard
select * from tsboard wher
drop table tsboard

insert into tsboard(nick, title, content, category, day) values('test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('hero','test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('new','test01','테스트입니다.','테스트다아아앙','category0',now())
       select * from tsboard where category like '%category%'
