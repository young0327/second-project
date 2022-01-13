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
);

CREATE TABLE app_list(
    app_no       INT UNSIGNED       COMMENT '앱 번호', 
    app_name     VARCHAR(20)       NOT NULL    COMMENT '앱  이름', 
    app_cate     VARCHAR(20)       NOT NULL    COMMENT '앱 카테고리', 
    app_price    VARCHAR(20) COMMENT '앱 가격', 
    app_rating   DECIMAL(12, 1)    NOT NULL    COMMENT '앱 평점', 
    app_company  VARCHAR(20)       NULL        COMMENT '앱 회사', 
     PRIMARY KEY (app_no)
);

insert into app_list(app_no,app_name,app_cate,app_rating,app_company) values (1,"카카오뮤직","music","4.3","kakao")
insert into app_list(app_no,app_name,app_cate,app_rating,app_company) values (2,"메론","music","4.3","malon")
insert into app_list(app_no,app_name,app_cate,app_rating,app_company) values (3,"벅스","music","4.1","bugsmusic")
insert into app_list ("1","카카오뮤직","music","4.3","kakao")

delete from tsboard where bidx=2
select * from app_list where app_name ="카카오뮤직"

select * from applist
select * from userinfo
select * from app_list
drop table app_list
desc app_list