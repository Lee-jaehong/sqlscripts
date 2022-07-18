insert into book_member values (book_seq.nextval, '이하니', 'honey@naver.com', '010-9889-0567', 1122);
insert into book_member values (book_seq.nextval, '이세종', 'jong@daum.net', '010-2354-6773', 2345);
insert into book_member values (book_seq.nextval, '최행운', 'lucky@korea.com', '010-5467-8792', 9876);
insert into book_member values (book_seq.nextval, '나길동', 'nadong@kkk.net', '010-3456-8765', 3456);
insert into book_member values (book_seq.nextval, '강감찬', 'haha@korea.net', '010-3987-9087', 1234);

insert into tbl_book values('A1101', '코스모스', '칼세이건', '사이언스북스', '2016-12-01');
insert into tbl_book values('B1101', '해커스토익', '이해커', '해커스랩', '2018-07-10');
insert into tbl_book values('C1101', '푸른사자 와니니', '이현', '창비', '2015-06-20');
insert into tbl_book values('A1102', '페스트', '알베르트까뮈', '민음사', '2011-03-01');

insert into tbl_bookrent values(rent_seq.nextval, 10001, 'B1101', '2021-09-01', '2021-09-15', '2021-09-14', null);
insert into tbl_bookrent values(rent_seq.nextval, 10002, 'C1101', '2021-09-12', '2021-09-26', '2021-09-29', null);
insert into tbl_bookrent values(rent_seq.nextval, 10003, 'B1101', '2021-09-03', '2021-09-17', '2021-09-17', null);
insert into tbl_bookrent values(rent_seq.nextval, 10004, 'C1101', '2022-06-30', '2022-07-14', null, null);
insert into tbl_bookrent values(rent_seq.nextval, 10001, 'A1101', '2022-07-04', '2022-07-18', null, null);
insert into tbl_bookrent values(rent_seq.nextval, 10003, 'A1102', '2022-07-06', '2022-07-20', '2022-07-13', null);

-- 참고하기 : 기본적인 동작은 대여날짜는 오늘, 반납기한은 오늘 +14를 기본값으로 할 수 있도록 합니다.
-- alter table "C##IDEV".tbl_bookrent modify rent_date date default sysdate;
-- alter table "C##IDEV".tbl_bookrent modify exp_date date default sysdate+14;
-- insert into tbl_bookrent(rent_no, mem_idx, bcode) values(bookrent_seq.nextval, 10002, 'A1102');

-- 컬럼 디폴트 값 없애고 싶을때
-- alter table "C##IDEV".tbl_bookrent modify rent_date date default null;