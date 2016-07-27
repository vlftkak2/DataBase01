--table list
select * from tab;

--table scheme
desc book;

create table book(
 no NUMBER,
 title VARCHAR(100),
 author VARCHAR(100),
 pub_date DATE
);

--예제 데이터 넣기
INSERT into book VALUES(1,'짝짝이','참새',to_date('2016-07-27', 'yyyy-mm-dd'));
INSERT into book VALUES(2,'어흥','호랑이',to_date('2016-07-27', 'yyyy-mm-dd'));
INSERT into book VALUES(3,'멍멍','맹몽이',to_date('2016-07-27', 'yyyy-mm-dd'));

select * from book;

--데이터를 넣으면서 테이블 생성하기(테이블 백업)
create table book_temp as( select * from book);
select * from book_temp;

--테이블 변경(칼럼 추가)
alter table book add (haha Varchar(400));
desc book;
select * from book;

--테이블 변경(컬럼 수정)
alter table book MODIFY(pubs varchar(500));
desc book;

--테이블 변경(컬럼 삭제)
alter table book DROP(pubs);

--unused (컬럼 Unused 설정)
alter table book set unused(author);
desc book;

--테이블 삭제
select * from book_temp;
drop table book_temp;
desc book_temp;

--테이블 데이터 삭제
TRUNCATE table book;
select * from book;

--comment 달기
comment on table book is 'this is comment';
select * from user_tab_comments;

--rename
rename book to article;
select * from article;

create table article(
 no NUMBER,
 title VARCHAR(100),
 pub_date DATE
);

commit;

--constraint(제약조건) -not null
create table book(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE
);

--error
--Insert into book values(1,null,null);
Insert into book values(1,' ','');
select * from book;

--constraint(제약조건) - unique
create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 CONSTRAINT c_book_unique unique(no)
);
insert into haha VALUES(1,'최형민',sysdate);
insert into haha VALUES(2,'쨱쨱이',sysdate);
insert into haha VALUES(3,'솔방이',sysdate);

drop table haha;

desc haha;
select * from haha;

--constraint(제약조건) - primary key -> not null조건과 + unique가 같이 걸려있으면 기본키이다.
create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 primary key(no)
);
insert into haha VALUES(1,'최형민',sysdate);
insert into haha VALUES(2,'쨱쨱이',sysdate);
insert into haha VALUES(3,'솔방이',sysdate);

--constraint(제약조건) - check

drop table haha;

create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 rate NUMBER NOT NULL,
 primary key(no),
 check(rate in(1,2,3,4,5))

);
insert into haha VALUES(1,'최형민',sysdate,5);
insert into haha VALUES(2,'쨱쨱이',sysdate,1);
insert into haha VALUES(3,'솔방이',sysdate,3);

select * from haha;
drop table author;
drop table haha;

--author table 생성
create table author(
no number,
name varchar2(80) not null,
description varchar2(2000),
primary key(no)
);

insert into author VALUES(1,'공자','어쩌구저쩌구..');
select * from author;

--constraint(제약조건) - Foregin key(외래키)

drop table haha casecade constraint;

create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 rate NUMBER NOT NULL,
 author_no NUMBER,
 constraint c_haha_pk primary key(no),
 constraint c_haha_rate check(rate in(1,2,3,4,5)),
 constraint c_haha_fk FOREIGN key(author_no)
 REFERENCES author(no) --pk삭제시 null로 세팅
 on delete cascade--on delete casecade pk 삭제시 함께 삭제 

);
insert into haha VALUES(1,'최형민',sysdate,5,1);
insert into haha VALUES(2,'쨱쨱이',sysdate,1);
insert into haha VALUES(3,'솔방이',sysdate,3);

select * from haha;

--foreign key 삭제 시 문제점
delete from haha; 
delete from book;
drop table Book;

select * from dictionary;

SELECT object_name 
FROM user_objects
WHERE object_type = 'TABLE';  


SELECT constraint_name, constraint_type,search_condition
FROM user_constraints
WHERE table_name = ‘BOOK';



