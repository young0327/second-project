create table user_info(
user_id varchar(10),
user_pwd varchar(10),
user_nick varchar(10),
user_joindate date,
primary key (user_id)
);

CREATE TABLE app_img
(
    app_id    VARCHAR(20)    NOT NULL    COMMENT '앱 아이디', 
    app_img1  TEXT           NULL        COMMENT '앱 이미지1', 
    app_img2  TEXT           NULL        COMMENT '앱 이미지2', 
    app_img3  TEXT           NULL        COMMENT '앱 이미지3', 
    app_img4  TEXT           NULL        COMMENT '앱 이미지4', 
     PRIMARY KEY (app_id)
);

ALTER TABLE app_img
    ADD CONSTRAINT FK_app_img_app_id_app_table_app_id FOREIGN KEY (app_id)
        REFERENCES app_table (app_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

create table applist(
apidx int not null  auto_increment,
appname varchar(30),
rating int,
primary key (apidx)
);

create table wordcloud_table
(word_no int unsigned not null auto_increment,
app_id varchar(20),
mode_word varchar(20),
mode_count int,
primary key(word_no))

insert into app_img values(1,"https://play-lh.googleusercontent.com/dVrao4PQ0z7boZlNeuhvrnptWnHSFVnZqlq-_qEnURY5HlTjRLiVpism40zWHq9KnN8=w720-h310-rw","https://play-lh.googleusercontent.com/oZiNqukKZ4kG2scPLX87KaE_Z_9aWHUG2nM_MT_R7D9Jic1Lv0xVXAbVtyA2tDYq7oE=w720-h310-rw","https://play-lh.googleusercontent.com/QBItVmd6s4HE0lk_Rz7JqKjttIiosuBkFmeHoJZ__VoDMrd40DKXE7GUyxWSZvL2Ig=w720-h310-rw","https://play-lh.googleusercontent.com/_-0IwyMNcUJWwlCP2O1SJwmybuWum4Lb9YaACjftSnoxMB736w5xleUBSwqUxdiZ3CU=w720-h310-rw")
CREATE TABLE app_review_table
(
    review_no       INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '리뷰 번호', 
    app_id          INT UNSIGNED        NOT NULL    COMMENT '앱 아이디', 
    review_title    VARCHAR(200)      NOT NULL    COMMENT '리뷰 제목', 
    review_content  TEXT              NOT NULL    COMMENT '리뷰 내용', 
    review_rating   DECIMAL(12, 1)    NOT NULL    COMMENT '리뷰 평점', 
    emo_result      DECIMAL(12, 1)    NULL        COMMENT '감성분석 결과', 
    review_date     DATETIME          NOT NULL    DEFAULT NOW() COMMENT '리뷰 날짜', 
    app_crawl_id    VARCHAR(50)       NOT NULL    COMMENT '리뷰 작성자', 
     PRIMARY KEY (review_no)
);
insert into app_review_table (app_id,review_title,review_content,review_rating,review_date,app_crawl_id)
values(1,"정말 좋아요!","정말 편하고 좋네요!!",4,"2021-12-30","tester");
insert into app_review_table (app_id,review_title,review_content,review_rating,review_date,app_crawl_id)
values(1,"그냥 그래요","그냥 그렇네요",3,"2021-11-25","tester2");
insert into app_review_table (app_id,review_title,review_content,review_rating,review_date,app_crawl_id)
values(1,"무조건 받아요!","정말 너무너무 좋네요!",5,"2021-12-08","tester3");
insert into app_review_table (app_id,review_title,review_content,review_rating,review_date,app_crawl_id)
values(1,"이걸 왜 받죠?","좋다고 한사람들 다 광고",2,"2022-01-02","tester4");
insert into app_review_table (app_id,review_title,review_content,review_rating,review_date,app_crawl_id)
values(1,"이게 뭐야....","시간이 아깝네요",1,"2021-12-22","tester5");

ALTER TABLE app_review_table modify COLUMN review_date Date ;


ALTER TABLE app_review_table
    ADD CONSTRAINT FK_app_review_table_app_id_app_list_app_id FOREIGN KEY (app_id)
        REFERENCES app_list (app_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE app_list(
    app_no       INT UNSIGNED       COMMENT '앱 번호', 
    app_name     VARCHAR(20)       NOT NULL    COMMENT '앱  이름', 
    app_cate     VARCHAR(20)       NOT NULL    COMMENT '앱 카테고리', 
    app_price    VARCHAR(20) COMMENT '앱 가격', 
    app_rating   DECIMAL(12, 1)    NOT NULL    COMMENT '앱 평점', 
    app_company  VARCHAR(20)       NULL        COMMENT '앱 회사', 
     PRIMARY KEY (app_no)
);

create table wordcloud_table(
app_id varchar(20),
mode_word varchar(20),
mode_count 	int,
primary key(app_id)
);


CREATE TABLE app_table
(
    app_name    VARCHAR(50)     NOT NULL    COMMENT '앱 이름', 
    app_id      VARCHAR(20)   NOT NULL    COMMENT '앱 아이디', 
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

alter table 
app_table 
add COLUMN 
app_point5 
INT;  

select count(*) from app_review_table where app_id = 1

insert into app_table(app_point1,app_point2,app_point3,app_point4,app_point5) values (2483,3572,1200,4257,7897) where app_id = 1;

update app_table set 
app_point1="2483",app_point2="3572",app_point3="1243",app_point4="4257",app_point5="7897" 
where app_name = "카카오뮤직";

select*from app_table
select*from app_review_table
drop table app_review_table
desc app_table
desc test
drop table applist
desc app_list
desc app_review_table
drop table user_info
DROP TABLE app_list CASCADE CONSTRAINTS;
alter table app_table add column app_cate varchar(20);
ALTER TABLE app_list DROP COLUMN app_cate;
alter table app_list add column app_cate varchar(20);
alter table app_review_table add column app_cate varchar(20);
alter table app_table add column app_pn decimal(12,1);
alter table app_table modify column eva_score1 decimal(12,1);
alter table app_table modify column eva_score2 decimal(12,1);
alter table app_table modify column eva_score3 decimal(12,1);
update app_table set app_pn = 4.5 where app_id =1;
update app_table set eva_score1 = 0.7
update app_table set eva_score2 = 0.42
update app_table set eva_score3 = 0.2

desc app_review_table
select * from app_review_table
alter table app_review_table add column pn decimal(12,1);
alter table app_review_table drop pn;
update app_review set emo_result = 0.75
update app_table set app_pn = 0.9 where app_id ="1";
select * from app_review_table where app_id =1
update app_review_table set emo_result=0.3 ,h_rv="1" where review_no=1;
update app_review_table set emo_result=0.7, h_rv="0" where review_no=2;
update app_review_table set emo_result=0.9 ,h_rv="1" where review_no=3;
update app_review_table set emo_result=0.2 ,h_rv="1" where review_no=4;
update app_review_table set emo_result=0.1 ,h_rv="1" where review_no=5;
update app_list set app_cate ="뮤직" where app_id =(select distinct app_id from app_review_table where app_cate="뮤직")
select avg(review_rating) from app_review_table where app_id = 1 and review_date between DATE_SUB(now(), INTERVAL 1 Month) and now()

select *from tsboard
select * from app_review_table
select count(*) from app_review_table where app_id = 1 and emo_result>=0.6 and emo_result<0.8
desc wordcloud_table
drop table wordcloud_table
insert into wordcloud_table(app_id, mode_word, mode_count) values("1","호텔",11552)
select * from wordcloud_table