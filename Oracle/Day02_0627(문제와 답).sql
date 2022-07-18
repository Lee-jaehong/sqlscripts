-- 1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

-- 2. lastname이 'Jones' 인 직원의 모든 컬럼

-- 3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

-- 4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

-- 5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회
SELECT first_name, last_name, email FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01'

SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';
-- 대소문자 검사는 조건식에 주의해야 합니다.
-- 컬럼값을 대소문자 변환 후 조건 값 비교 -> 대소문자 무관하게 검사하는 방법
SELECT * FROM EMPLOYEES e WHERE upper(LAST_NAME) = 'JONES';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME) = 'jones';

SELECT first_name, last_name, job_id FROM EMPLOYEES e WHERE SALARY >= 5000;

SELECT first_name, last_name, salary FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

SELECT EMPLOYEE_ID, first_name, last_name FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50,60,80,90);
SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = 60;
SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = '60';	--컬럼형식에 따라 변환

-- 통계 함수 : count, avg, max, min. 통계함수는 그룹함수라고도 합니다.
--			해당 함수 결과갑을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한후 실행
SELECT  COUNT(*) FROM EMPLOYEES e ;
SELECT MAX(salary) FROM EMPLOYEES e ; 
SELECT min(salary) FROM EMPLOYEES e ;
SELECT avg(salary) FROM EMPLOYEES e ;
SELECT sum(SALARY) FROM EMPLOYEES e ;

-- 위 5개 통계함수를 job_id = 'it_prog' 값을 조건식으로 똑같이 실행해보기

SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	--
SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; 
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT avg(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- 통계함수 결과는 다른 컬럼값과 같이 조회못합니다.(그룹함수이기 때문입니다.)
SELECT JOB_ID, count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- 오늘의 요약: create table, insert into, select~ where~ 기본 형식

-- 참고 : 별칭(alias)
SELECT * FROM EMPLOYEES e ;	-- EMPLYEES 테이블의 별칭 e
SELECT * FROM DEPARTMENTS d ;	-- DEPARTMENTS 테이블의 별칭 d
-- 위에서는 굳이 별칭이 필요없습니다. 언젠가 유용하게 사용

