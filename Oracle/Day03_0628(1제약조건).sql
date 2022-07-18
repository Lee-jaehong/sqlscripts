-- ���� ���� ������ create table, alter table ���� �մϴ�.


-- ���� ���� 1 : not null
CREATE TABLE tbl#(
	col1 varchar2(10),
	col2 number(3) NOT NULL
);

INSERT INTO tbl#(col2) VALUES (98);
INSERT INTO tbl#(col1) VALUES ('korean');	-- ���� : col2 �÷��� NOT NULL �������� ����
INSERT INTO tbl# VALUES ('korean', 78);
INSERT INTO tbl# VALUES ('koeran', 88);
-- Ȯ��
SELECT * FROM tbl#;
-- ���ο� �������� 2) unique�� ���� col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;	-- ������ ���̾�� �մϴ�.
-- ���� insert �߿��� ������ �߻��ϴ� ����?
INSERT INTO tbl#(col1) VALUES ('english');	-- ����
INSERT INTO tbl#(col2) VALUES (77);
INSERT INTO tbl#(col3) VALUES ('english');	-- ����
INSERT INTO tbl#(col1, col2) VALUES ('english', 88);
INSERT INTO tbl#(col2, col3) VALUES (88, 'science');
INSERT INTO tbl#(col1, col3) VALUES ('science', 88);	-- ����
-- SQL Error [1] [23000]: ORA-00001: ���Ἲ ���� ����(C##IDEV.SYS_C008349)�� ����˴ϴ�
INSERT INTO tbl# VALUES ('science', 89, 'science');		-- ����
INSERT INTO tbl# VALUES ('science', 89, 'math');
-- üũ ���� : unique �÷����� null ���� ���˴ϴ�.

-- ���� ���� 3) �⺻Ű (primary key)��  not null�� unique ���� �����Դϴ�.
CREATE TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM tbl2#;
--���Ἲ ���� ����(pk �⺻Ű �÷��� ������ ���̸鼭 not null �Դϴ�.)�� ����˴ϴ�
INSERT INTO tbl2#(tno) VALUES (123);	-- unique
INSERT INTO tbl2#(tid) VALUES (123);	-- NOT NULL

-- �������� 4) check : �÷����� ������ ���� -> age �÷� ���� 16~80, null ��� �մϴ�.
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2#(tno,tid, age) VALUES (222,123,20); 
INSERT INTO TBL2#(tno,tid, age) VALUES (222,123,90);	-- ����: üũ �������� ����
-- ���� gender �÷� �߰�
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN('M','F'));
INSERT INTO "TBL2#" (tno, gender) VALUES (224,'F');
INSERT INTO "TBL2#" (tno, gender) VALUES (225,'M');
INSERT INTO "TBL2#" (tno, gender) VALUES (226,'m'); -- ����: chek �������� ����
SELECT * FROM "TBL2#" t ;
-- ���� gender �÷��� �������� ������
ALTER TABLE "TBL2#" DROP CONSTRAINT "TBL2__chk_gender";
ALTER TABLE "TBL2#" ADD CONSTRAINT tbl2_chk_gender2 CHECK (gender IN ('M','F','m','f'));
-- ���� gender �÷��� �������� �����ϴ� ���� �ٸ� ��ɾ�� �ؾ��մϴ�.
-- alter table ~drop constraints �� ���� �������� �����ؾ��մϴ�.
INSERT INTO "TBL2#" (tno,gender) VALUES (226,'m');
INSERT INTO "TBL2#" (tno,gender) VALUES (227,'f');


