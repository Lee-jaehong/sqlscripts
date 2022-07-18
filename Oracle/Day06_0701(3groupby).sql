-- ���� : ���� �׷�ȭ �׷��Լ��� ��� �մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�.
-- select��
-- [where] �׷�ȭ �ϱ� ���� ����� ���ǽ�
-- group BY �׷�ȭ�� ����� �÷���
-- [HAVING] �׷�ȭ ����� ���� ���ǽ�
-- [order BY] �׷�ȭ ��� ���� �÷���� ���

SELECT * FROM TBL_BUY tb;
SELECT pcode, count(*) FROM TBL_BUY tb GROUP BY pcode;
SELECT pcode, count(*), sum(quantity) 
	FROM TBL_BUY tb 
	GROUP BY pcode
	ORDER BY 2;		-- ��ȸ�� �÷��� ��ġ(�ε��� 0������ X 1������ O)

SELECT pcode, count(*) cnt, sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY pcode
	ORDER BY cnt;		-- �׷��Լ� ����� ��Ī
	
-- �׷�ȭ �Ŀ� �����հ谡 3�̻� ��ȸ
	SELECT pcode, count(*) cnt, sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY pcode
--  HAVING total >=3	-- having ���� �÷� ��Ī ��� ����. ���̺� �÷����� ��� ����
	HAVING sum(quantity) >=3
	ORDER BY cnt;		-- �׷��Լ� ����� ��Ī
	
-- ���ų�¥ 2022-04-01 ���� �� �͸� �׷�ȭ�Ͽ� ���
SELECT pcode, count(*) cnt, sum(quantity) total 
	FROM TBL_BUY tb 
	where BUY_DATE >= '2022-04-01'
	GROUP BY pcode
	ORDER BY cnt;
	
-- Day2 ����
-- ��� �Լ� : count, avg, max, min, sum. ����Լ��� �׷��Լ���� �մϴ�.
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
 