create table book_member (
mem_idx number(5) primary key,
name varchar2(20) not null,
email varchar2(20) unique not null,
tel varchar2(20) unique,
password varchar2(10));

create table tbl_book (
bcode char(5) primary key,
title varchar2(30) not null,
writer varchar2(20),
publisher varchar2(20),
pdate date);

create table tbl_bookrent (
rent_no number(5) primary key,
mem_idx number(5) not null,
bcode char(5) not null,
rent_date date not null,
exp_date date not null,
return_date date,
delay_days number(3),
foreign key (mem_idx) references book_member(mem_idx),
foreign key (bcode) references tbl_book(bcode)
);


create sequence book_seq
start with 10001;

create sequence rent_seq;