-- 주제 : 행을 그룹화 그룹함수를 사용 합니다. 사용하는 순서는 아래처럼 합니다.
-- select문
-- [where] 그룹화 하기 전에 사용할 조건식
-- group BY 그룹화에 사용할 컬럼명
-- [HAVING] 그룹화 결과에 대한 조건식
-- [order BY] 그룹화 결과 정렬 컬럼명과 방식

SELECT * FROM TBL_BUY tb;
SELECT pcode, count(*) FROM TBL_BUY tb GROUP BY pcode;
SELECT pcode, count(*), sum(quantity) 
	FROM TBL_BUY tb 
	GROUP BY pcode
	ORDER BY 2;		-- 조회된 컬럼의 위치(인덱스 0번부터 X 1번부터 O)

SELECT pcode, count(*) cnt, sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY pcode
	ORDER BY cnt;		-- 그룹함수 결과의 별칭
	
-- 그룹화 후에 수량합계가 3이상만 조회
	SELECT pcode, count(*) cnt, sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY pcode
--  HAVING total >=3	-- having 에는 컬럼 별칭 사용 못함. 테이블 컬럼며은 사용 가능
	HAVING sum(quantity) >=3
	ORDER BY cnt;		-- 그룹함수 결과의 별칭
	
-- 구매날짜 2022-04-01 이후 인 것만 그룹화하여 출력
SELECT pcode, count(*) cnt, sum(quantity) total 
	FROM TBL_BUY tb 
	where BUY_DATE >= '2022-04-01'
	GROUP BY pcode
	ORDER BY cnt;
	
-- Day2 참고
-- 통계 함수 : count, avg, max, min, sum. 통계함수는 그룹함수라고도 합니다.
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
 