-- ����ȫ
CREATE TABLE student (
	student_number char(7) PRIMARY KEY,
	name varchar2(10) NOT null,
	age number(2),
	addres varchar2(10)
);
INSERT INTO student values(2021001, '����', 16, '���ʱ�');
INSERT INTO student values(2019019, '������', 18, '������');

SELECT * FROM student;

CREATE TABLE scores (
	student_number char(7),
	subject_name varchar2(7),
	score number(2) NOT null,
	teacher varchar2(10) NOT null,
	class_season varchar(10) NOT null,
	CONSTRAINT scores PRIMARY KEY(student_number, subject_name)
);
INSERT INTO scores VALUES (2021001,'����', 89, '�̳���', '2022_1');
INSERT INTO scores VALUES (2021001,'����', 78, '��浿', '2022_1');
INSERT INTO scores VALUES (2021001,'����', 67, '�ڼ���', '2021_2');
INSERT INTO scores VALUES (2019019,'����', 92, '�̳���', '2019_2');
INSERT INTO scores VALUES (2019019,'����', 85, '������', '2019_2');
INSERT INTO scores VALUES (2019019,'����', 88, '�ڼ���', '2020_1');

SELECT * FROM scores;