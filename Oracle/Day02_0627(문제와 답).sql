-- 1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

-- 2. lastname�� 'Jones' �� ������ ��� �÷�

-- 3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

-- 4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

-- 5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
SELECT first_name, last_name, email FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01'

SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';
-- ��ҹ��� �˻�� ���ǽĿ� �����ؾ� �մϴ�.
-- �÷����� ��ҹ��� ��ȯ �� ���� �� �� -> ��ҹ��� �����ϰ� �˻��ϴ� ���
SELECT * FROM EMPLOYEES e WHERE upper(LAST_NAME) = 'JONES';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME) = 'jones';

SELECT first_name, last_name, job_id FROM EMPLOYEES e WHERE SALARY >= 5000;

SELECT first_name, last_name, salary FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

SELECT EMPLOYEE_ID, first_name, last_name FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50,60,80,90);
SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = 60;
SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = '60';	--�÷����Ŀ� ���� ��ȯ

-- ��� �Լ� : count, avg, max, min. ����Լ��� �׷��Լ���� �մϴ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ���� ����
SELECT  COUNT(*) FROM EMPLOYEES e ;
SELECT MAX(salary) FROM EMPLOYEES e ; 
SELECT min(salary) FROM EMPLOYEES e ;
SELECT avg(salary) FROM EMPLOYEES e ;
SELECT sum(SALARY) FROM EMPLOYEES e ;

-- �� 5�� ����Լ��� job_id = 'it_prog' ���� ���ǽ����� �Ȱ��� �����غ���

SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	--
SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; 
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT avg(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ���մϴ�.(�׷��Լ��̱� �����Դϴ�.)
SELECT JOB_ID, count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- ������ ���: create table, insert into, select~ where~ �⺻ ����

-- ���� : ��Ī(alias)
SELECT * FROM EMPLOYEES e ;	-- EMPLYEES ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ;	-- DEPARTMENTS ���̺��� ��Ī d
-- �������� ���� ��Ī�� �ʿ�����ϴ�. ������ �����ϰ� ���

