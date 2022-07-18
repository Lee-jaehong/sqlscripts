--DDL : create,alter,drop,turncate
-- 대상은 user,table,sequence,view ,... 단 truncate는 테이블만 사용
--DML : insert, update, delete, select

--drop으로 테이블 삭제하기
DROP TABLE STUDENTS0 ; --오류 : students0 테이블 먼저 삭제하면 오류
-- 원인 : 외래키에 의해 참조되는 고유/기본 키가 테이블에 존재.
DROP TABLE SCORES0 ;

--UPDATE 테이블명 set 컬럼명 = 값,컬럼명 =값,컬럼명 =값,...
--where 조컨컬럼 조건식
--DELETE FROM 테이블명 WHERE 조건컬럼관계식
-- 주의사항 : update, delete는 where없이 사용하는것은 위험하다    
-- 
--truncate는 실행을 취소(rollback) 할 수 없기때문에 DDL에 포함됩니다.
SELECT * FROM STUDENTS0;
-- update, delete, select에서 where의 컬럼이 기본키 컬럼으로 동등조건이면
--실행되는 결과가 반영되는 행은 몇개?? >> 최대1개 : 기본키의 목적은 테이블의 여러행동들을 식별하는 것 
UPDATE STUDENTS0 SET age = 17 WHERE stuno = 2021001;

--rollback , commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 MANUAL로 변경)
-- 순서대로 실행하세요
UPDATE STUDENTS0 SET ADDRESS = '성북구',AGE=16 WHERE STUNO =2021001;
ROLLBACK;	-- 위의 UPDATE 실행을 취소, 다시 '서초구', 17세로 복구
SELECT * FROM STUDENTS0 s;
UPDATE STUDENTS0 SET ADDRESS = '성북구',AGE=16 WHERE STUNO =2021001;
COMMIT;		-- '성북구', 16세로 반영됨.
SELECT * FROM STUDENTS0 s;
ROLLBACK;	-- 이미 commit이 된 명령어는 ROLLBACK 못함.
SELECT * FROM STUDENTS0 s;
-- 트랜잭션 관리명령 : rollback, commit
DELETE FROM SCORES0 ;
ROLLBACK;
SELECT * FROM SCORES0 s ;
DELETE FROM SCORES0 WHERE STUNO = 2019019;
SELECT * FROM scores0;
-- 이 편집기는 트랜잭션 수동 모드이므로 같은 창에서는 select 결과가 2019019가 없습니다.
-- 다른 편집기는 다른 클라이언트 이므로 이전 상태(최종 커밋한 상태)로 보여집니다.
ROLLBACK;
SELECT * FROM scores0;
SELECT * FROM STUDENTS0 s;
SELECT * FROM SCORES0 s; 

TRUNCATE TABLE SCORES0;	-- 모든 데이터 삭제, ROLLBACK 불가능
ROLLBACK;
SELECT * FROM SCORES0 s;
-- 모든데이터를 지울것이 확실하면 다른것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 해라.

/*
 * INSERT
 * DELETE
 * COMMIT;		(1) 라인 50, 51
 * UPDATE
 * DELETE;
 * ROLLBACK;	(2) 라인 53, 54
 * INSERT;
 * INSERT;
 * ROLLBACK;	(3) 라인 56, 57
 * INSERT
 * UPDATE;
 * COMMIT;		(4) 라인 59, 60
 * 
 */
