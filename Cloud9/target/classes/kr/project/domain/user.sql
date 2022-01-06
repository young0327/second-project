create table userinfo( 
id varchar(10),
pwd varchar(10) not null,
nick varchar (10) not null,
primary key (id)
);


insert into userinfo values('test1','1234','test1')

select * from userinfo
delete from userinfo where nick = ""
desc proboard
select * from tsboard

insert into tsboard values('test','test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('hero','test01','테스트입니다.','테스트다아아앙','category0',now())
insert into tsboard values('new','test01','테스트입니다.','테스트다아아앙','category0',now())
       select * from tsboard where category like '%category%'

