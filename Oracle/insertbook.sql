insert into book_member values (book_seq.nextval, '���ϴ�', 'honey@naver.com', '010-9889-0567', 1122);
insert into book_member values (book_seq.nextval, '�̼���', 'jong@daum.net', '010-2354-6773', 2345);
insert into book_member values (book_seq.nextval, '�����', 'lucky@korea.com', '010-5467-8792', 9876);
insert into book_member values (book_seq.nextval, '���浿', 'nadong@kkk.net', '010-3456-8765', 3456);
insert into book_member values (book_seq.nextval, '������', 'haha@korea.net', '010-3987-9087', 1234);

insert into tbl_book values('A1101', '�ڽ���', 'Į���̰�', '���̾𽺺Ͻ�', '2016-12-01');
insert into tbl_book values('B1101', '��Ŀ������', '����Ŀ', '��Ŀ����', '2018-07-10');
insert into tbl_book values('C1101', 'Ǫ������ �ʹϴ�', '����', 'â��', '2015-06-20');
insert into tbl_book values('A1102', '�佺Ʈ', '�˺���Ʈ�', '������', '2011-03-01');

insert into tbl_bookrent values(rent_seq.nextval, 10001, 'B1101', '2021-09-01', '2021-09-15', '2021-09-14', null);
insert into tbl_bookrent values(rent_seq.nextval, 10002, 'C1101', '2021-09-12', '2021-09-26', '2021-09-29', null);
insert into tbl_bookrent values(rent_seq.nextval, 10003, 'B1101', '2021-09-03', '2021-09-17', '2021-09-17', null);
insert into tbl_bookrent values(rent_seq.nextval, 10004, 'C1101', '2022-06-30', '2022-07-14', null, null);
insert into tbl_bookrent values(rent_seq.nextval, 10001, 'A1101', '2022-07-04', '2022-07-18', null, null);
insert into tbl_bookrent values(rent_seq.nextval, 10003, 'A1102', '2022-07-06', '2022-07-20', '2022-07-13', null);

-- �����ϱ� : �⺻���� ������ �뿩��¥�� ����, �ݳ������� ���� +14�� �⺻������ �� �� �ֵ��� �մϴ�.
-- alter table "C##IDEV".tbl_bookrent modify rent_date date default sysdate;
-- alter table "C##IDEV".tbl_bookrent modify exp_date date default sysdate+14;
-- insert into tbl_bookrent(rent_no, mem_idx, bcode) values(bookrent_seq.nextval, 10002, 'A1102');

-- �÷� ����Ʈ �� ���ְ� ������
-- alter table "C##IDEV".tbl_bookrent modify rent_date date default null;