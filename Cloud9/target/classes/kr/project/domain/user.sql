create table userinfo( 
id varchar(10),
pwd varchar(10) not null,
nick varchar (10) not null,
primary key (id)
);


insert into userinfo values('test1','1234','test1')

select * from userinfo
delete from userinfo where nick = ""