-- 이재홍
CREATE TABLE student (
	student_number char(7) PRIMARY KEY,
	name varchar2(10) NOT null,
	age number(2),
	addres varchar2(10)
);
INSERT INTO student values(2021001, '김모모', 16, '서초구');
INSERT INTO student values(2019019, '강다현', 18, '강남구');

SELECT * FROM student;

CREATE TABLE scores (
	student_number char(7),
	subject_name varchar2(7),
	score number(2) NOT null,
	teacher varchar2(10) NOT null,
	class_season varchar(10) NOT null,
	CONSTRAINT scores PRIMARY KEY(student_number, subject_name)
);
INSERT INTO scores VALUES (2021001,'국어', 89, '이나연', '2022_1');
INSERT INTO scores VALUES (2021001,'영어', 78, '김길동', '2022_1');
INSERT INTO scores VALUES (2021001,'과학', 67, '박세리', '2021_2');
INSERT INTO scores VALUES (2019019,'국어', 92, '이나연', '2019_2');
INSERT INTO scores VALUES (2019019,'영어', 85, '박지성', '2019_2');
INSERT INTO scores VALUES (2019019,'과학', 88, '박세리', '2020_1');

SELECT * FROM scores;