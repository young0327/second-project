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

create table applist(
apidx int not null  auto_increment,
appname varchar(30),
rating int,
primary key (apidx)
)

insert into tsboard(nick, title, content, category, day) values('test01','테스트입니다.','테스트다아아앙','category0',now())
insert into applist(appname,rating) values('카카오톡','4.7')
insert into applist(appname,rating) values('질병관리청 COOV(코로나19 전자예방접종증명서)','4')
insert into applist(appname,rating) values('티빙','3')
insert into applist(appname,rating) values('카카오뱅크','5')
insert into applist(appname,rating) values('카카오택시','4')

insert into userinfo values('test1','1234','test1')
select * from applist
select * from userinfo
delete from tsboard where bidx = '14'
desc tsboard
select * from tsboard
drop table tsboard
