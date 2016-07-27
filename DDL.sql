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

--���� ������ �ֱ�
INSERT into book VALUES(1,'¦¦��','����',to_date('2016-07-27', 'yyyy-mm-dd'));
INSERT into book VALUES(2,'����','ȣ����',to_date('2016-07-27', 'yyyy-mm-dd'));
INSERT into book VALUES(3,'�۸�','�͸���',to_date('2016-07-27', 'yyyy-mm-dd'));

select * from book;

--�����͸� �����鼭 ���̺� �����ϱ�(���̺� ���)
create table book_temp as( select * from book);
select * from book_temp;

--���̺� ����(Į�� �߰�)
alter table book add (haha Varchar(400));
desc book;
select * from book;

--���̺� ����(�÷� ����)
alter table book MODIFY(pubs varchar(500));
desc book;

--���̺� ����(�÷� ����)
alter table book DROP(pubs);

--unused (�÷� Unused ����)
alter table book set unused(author);
desc book;

--���̺� ����
select * from book_temp;
drop table book_temp;
desc book_temp;

--���̺� ������ ����
TRUNCATE table book;
select * from book;

--comment �ޱ�
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

--constraint(��������) -not null
create table book(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE
);

--error
--Insert into book values(1,null,null);
Insert into book values(1,' ','');
select * from book;

--constraint(��������) - unique
create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 CONSTRAINT c_book_unique unique(no)
);
insert into haha VALUES(1,'������',sysdate);
insert into haha VALUES(2,'������',sysdate);
insert into haha VALUES(3,'�ֹ���',sysdate);

drop table haha;

desc haha;
select * from haha;

--constraint(��������) - primary key -> not null���ǰ� + unique�� ���� �ɷ������� �⺻Ű�̴�.
create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 primary key(no)
);
insert into haha VALUES(1,'������',sysdate);
insert into haha VALUES(2,'������',sysdate);
insert into haha VALUES(3,'�ֹ���',sysdate);

--constraint(��������) - check

drop table haha;

create table haha(
 no NUMBER Not null,
 title VARCHAR(100) not null,
 pub_date DATE,
 rate NUMBER NOT NULL,
 primary key(no),
 check(rate in(1,2,3,4,5))

);
insert into haha VALUES(1,'������',sysdate,5);
insert into haha VALUES(2,'������',sysdate,1);
insert into haha VALUES(3,'�ֹ���',sysdate,3);

select * from haha;
drop table author;
drop table haha;

--author table ����
create table author(
no number,
name varchar2(80) not null,
description varchar2(2000),
primary key(no)
);

insert into author VALUES(1,'����','��¼����¼��..');
select * from author;

--constraint(��������) - Foregin key(�ܷ�Ű)

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
 REFERENCES author(no) --pk������ null�� ����
 on delete cascade--on delete casecade pk ������ �Բ� ���� 

);
insert into haha VALUES(1,'������',sysdate,5,1);
insert into haha VALUES(2,'������',sysdate,1);
insert into haha VALUES(3,'�ֹ���',sysdate,3);

select * from haha;

--foreign key ���� �� ������
delete from haha; 
delete from book;
drop table Book;

select * from dictionary;

SELECT object_name 
FROM user_objects
WHERE object_type = 'TABLE';  


SELECT constraint_name, constraint_type,search_condition
FROM user_constraints
WHERE table_name = ��BOOK';



