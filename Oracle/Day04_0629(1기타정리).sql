--DDL : create,alter,drop,turncate
-- ����� user,table,sequence,view ,... �� truncate�� ���̺� ���
--DML : insert, update, delete, select

--drop���� ���̺� �����ϱ�
DROP TABLE STUDENTS0 ; --���� : students0 ���̺� ���� �����ϸ� ����
-- ���� : �ܷ�Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� ����.
DROP TABLE SCORES0 ;

--UPDATE ���̺�� set �÷��� = ��,�÷��� =��,�÷��� =��,...
--where �����÷� ���ǽ�
--DELETE FROM ���̺�� WHERE �����÷������
-- ���ǻ��� : update, delete�� where���� ����ϴ°��� �����ϴ�    
-- 
--truncate�� ������ ���(rollback) �� �� ���⶧���� DDL�� ���Ե˴ϴ�.
SELECT * FROM STUDENTS0;
-- update, delete, select���� where�� �÷��� �⺻Ű �÷����� ���������̸�
--����Ǵ� ����� �ݿ��Ǵ� ���� �?? >> �ִ�1�� : �⺻Ű�� ������ ���̺��� �����ൿ���� �ĺ��ϴ� �� 
UPDATE STUDENTS0 SET age = 17 WHERE stuno = 2021001;

--rollback , commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 MANUAL�� ����)
-- ������� �����ϼ���
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�',AGE=16 WHERE STUNO =2021001;
ROLLBACK;	-- ���� UPDATE ������ ���, �ٽ� '���ʱ�', 17���� ����
SELECT * FROM STUDENTS0 s;
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�',AGE=16 WHERE STUNO =2021001;
COMMIT;		-- '���ϱ�', 16���� �ݿ���.
SELECT * FROM STUDENTS0 s;
ROLLBACK;	-- �̹� commit�� �� ��ɾ�� ROLLBACK ����.
SELECT * FROM STUDENTS0 s;
-- Ʈ����� ������� : rollback, commit
DELETE FROM SCORES0 ;
ROLLBACK;
SELECT * FROM SCORES0 s ;
DELETE FROM SCORES0 WHERE STUNO = 2019019;
SELECT * FROM scores0;
-- �� ������� Ʈ����� ���� ����̹Ƿ� ���� â������ select ����� 2019019�� �����ϴ�.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ� ���� ����(���� Ŀ���� ����)�� �������ϴ�.
ROLLBACK;
SELECT * FROM scores0;
SELECT * FROM STUDENTS0 s;
SELECT * FROM SCORES0 s; 

TRUNCATE TABLE SCORES0;	-- ��� ������ ����, ROLLBACK �Ұ���
ROLLBACK;
SELECT * FROM SCORES0 s;
-- ��絥���͸� ������� Ȯ���ϸ� �ٸ��͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ض�.

/*
 * INSERT
 * DELETE
 * COMMIT;		(1) ���� 50, 51
 * UPDATE
 * DELETE;
 * ROLLBACK;	(2) ���� 53, 54
 * INSERT;
 * INSERT;
 * ROLLBACK;	(3) ���� 56, 57
 * INSERT
 * UPDATE;
 * COMMIT;		(4) ���� 59, 60
 * 
 */
