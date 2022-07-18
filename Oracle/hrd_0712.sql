create table Member_tbl_02(custno number(6) primary key,custname varchar2(20), phone varchar2(13), address varchar2(60), joindate date, grade char(1), city char(2)); 

create table money_tbl_02(custno number(6) not null, saleno number(8) not null, pcost number(8), amount number(4), price number(8), pcode varchar2(4), sdate date, primary key(custno, saleno), foreign key(custno) references member_tbl_02(custno));

create sequence member_seq start with 100001;

insert into Member_tbl_02 values(member_seq.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', to_date('2015-12-02', 'YYYY-MM-DD'), 'A', '01');
insert into Member_tbl_02 values(member_seq.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', to_date('20151206', 'YYYYMMDD'), 'B', '01');
insert into Member_tbl_02 values(member_seq.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', to_date('20151001', 'YYYYMMDD'), 'B', '30');
insert into Member_tbl_02 values(member_seq.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', to_date('20151113', 'YYYYMMDD'), 'A', '30');
insert into Member_tbl_02 values(member_seq.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', to_date('20151225', 'YYYYMMDD'), 'B', '60');
insert into Member_tbl_02 values(member_seq.nextval, '차공단', '010-1111-7777', '제주도 제주시 감나무골', to_date('20151211', 'YYYYMMDD'), 'C', '60');

insert into  money_tbl_02 values(100001, 20160001, 500, 5, 2500, 'A001','2016-01-01');
insert into  money_tbl_02 values(100001, 20160002, 1000, 4, 4000, 'A002','2016-01-01');
insert into  money_tbl_02 values(100001, 20160003, 500, 3, 1500, 'A008','2016-01-01');
insert into  money_tbl_02 values(100002, 20160004, 2000, 1, 2000, 'A004','2016-01-02');
insert into  money_tbl_02 values(100002, 20160005, 500, 1, 500, 'A001', '2016-01-03');
insert into  money_tbl_02 values(100003, 20160006, 1500, 2, 3000, 'A003','2016-01-03');
insert into  money_tbl_02 values(100004, 20160007, 500, 2, 1000, 'A001','2016-01-04');
insert into  money_tbl_02 values(100004, 20160008, 300, 1, 300, 'A005','2016-01-04');
insert into  money_tbl_02 values(100004, 20160009, 600, 1, 600, 'A006','2016-01-04');
insert into  money_tbl_02 values(100004, 20160010, 3000, 1, 3000, 'A007','2016-01-06');
select * from Member_tbl_02;
select * from money_tbl_02;

