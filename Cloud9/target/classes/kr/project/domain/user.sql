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


CREATE TABLE app_table
(
    app_name    VARCHAR(50)     NOT NULL    COMMENT '앱 이름', 
    app_id      INT UNSIGNED    NOT NULL    COMMENT '앱 아이디', 
    app_img1    VARCHAR(200)    NULL        COMMENT '앱 이미지1', 
    app_img2    VARCHAR(200)    NULL        COMMENT '앱 이미지2', 
    app_img3    VARCHAR(200)    NULL        COMMENT '앱 이미지3', 
    app_img4    VARCHAR(200)    NULL        COMMENT '앱 이미지4', 
    app_icon   VARCHAR(200)    NULL        COMMENT '앱 아이콘', 
    app_rating  INT             NOT NULL    COMMENT '앱 평균별점', 
    app_info    TEXT            NOT NULL    COMMENT '앱 상세정보', 
    app_url     VARCHAR(200)    NULL        COMMENT '연결url', 
     PRIMARY KEY (app_name)
);

ALTER TABLE app_table
    ADD CONSTRAINT FK_app_table_app_id_app_list_app_no FOREIGN KEY (app_id)
        REFERENCES app_list (app_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

alter table app_list change column app_no app_id INT UNSIGNED;
alter table app_list modify column app_name varchar(50);
delete from tsboard where bidx=2
select * from app_list where app_name ="카카오뮤직"
 select * from app_table where app_id = 1
select * from applist
select * from userinfo
select * from app_list
select * from app_table
desc app_table
desc test
drop table app_list
desc app_list