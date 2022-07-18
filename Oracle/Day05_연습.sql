CREATE TABLE tbl_custom(
	custom_id varchar2(20) PRIMARY key,
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate
);
CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);
CREATE TABLE tbl_buy(
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL,
	buy_date DATE DEFAULT sysdate
);
-- Date ���Ŀ� �����Ǵ� ���� �����ϱ� -> insert �� �� to_date �Լ� �������� 
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
INSERT INTO tbl_custom 
VALUES ('mina012', '��̳�', 'kimm@gmail.com', 20, '2022-03-10 14:23:00');
INSERT INTO tbl_custom 
VALUES ('hongGD', 'ȫ�浿', 'gil@korea.com', 32, to_date('2021-10-21 00:00','YYYY-MM-DD HH24:MI'));
INSERT INTO tbl_custom 
VALUES ('twice', '�ڸ��', 'momo@daum.net', 29, to_date('2021-12-25 00:00','YYYY-MM-DD HH24:MI'));
-- INSERT INTO tbl_custom 
-- VALUES ('wonder', '�̳���', 'lee@naver.com', 40, sysdate);
INSERT INTO tbl_custom(custom_id,name,email,age)
VALUES ('wonder', '�̳���', 'lee@naver.com', 40);	-- reg_date �÷��� DEFAULT sysdate

INSERT INTO tbl_product values('IPAD011', 'A1', '�����е�10', 888000);
INSERT INTO tbl_product values('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO tbl_product values('dk_143', 'A2', '��ǵ���ũ', 234500);

INSERT INTO tbl_buy VALUES('mina012', 'IPAD011', 1, '2022-02-06 00:00:00');
INSERT INTO tbl_buy VALUES('hongGD', 'IPAD011', 2, '2022-06-29 20:37:47');
INSERT INTO tbl_buy VALUES('wonder', 'DOWON123a', 3, '2022-02-06 00:00:00');
INSERT INTO tbl_buy (custom_id,PCODE,QUANTITY) VALUES('mina012', 'dk_143', 1);
INSERT INTO tbl_buy VALUES('twice', 'DOWON123a', 2, '2022-02-09 08:49:55');

ALTER TABLE tbl_buy ADD buyno number(8);

UPDATE tbl_buy SET buyno = 1001 WHERE CUSTOM_ID = 'mina012' AND PCODE = 'IPAD011';
UPDATE tbl_buy SET buyno = 1002 WHERE CUSTOM_ID = 'hongGD';
UPDATE tbl_buy SET buyno = 1003 WHERE CUSTOM_ID = 'wonder';
UPDATE tbl_buy SET buyno = 1004 WHERE CUSTOM_ID = 'mina012' AND PCODE = 'dk_143';
UPDATE tbl_buy SET buyno = 1005 WHERE CUSTOM_ID = 'twice';

ALTER TABLE TBL_BUY MODIFY buyno PRIMARY KEY;
ALTER TABLE TBL_BUY MODIFY FOREIGN KEY(custom_id) REFERENCES tbl_custom(custom_id);
ALTER TABLE TBL_BUY MODIFY FOREIGN KEY(pcode) REFERENCES tbl_product(pcode);

CREATE SEQUENCE tblbuy_seq
	START WITH 1006;

INSERT INTO tbl_buy(buyno,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(tblbuy_seq.nextval, 'wonder', 'IPAD011', 1, to_date('2022-05-15 00:00:00','YYYY-MM-DD HH24:MI:ss'));
SELECT * FROM TBL_CUSTOM tc WHERE age>=30;
SELECT email FROM TBL_CUSTOM tc WHERE CUSTOM_ID = 'twice';
SELECT pname FROM TBL_PRODUCT tp WHERE CATEGORY = 'A2';
SELECT MAX(price) FROM TBL_PRODUCT tp;
SELECT sum(quantity) FROM TBL_BUY tb WHERE pcode = 'IPAD011';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';
SELECT * FROM TBL_BUY tb WHERE pcode LIKE '%0%';
SELECT * FROM TBL_BUY tb WHERE lower(pcode) LIKE '%on%';