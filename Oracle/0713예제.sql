INSERT INTO TBL_BOOK VALUES ('B1102', '스트라이크 던지기','박철순','KBO','2020-11-10');
-- 반납된 도서의 연체일수 계산하여 delay_date 업데이트하기
UPDATE TBL_BOOKRENT SET delay_days = RETURN_DATE - EXP_DATE  WHERE  RETURN_DATE IS NOT NULL;
-- 대출중인 도서의 연체일수 계산해서 회원idx, 도서코드, 연체일수 조회하기
SELECT mem_idx, bcode, trunc(sysdate) - exp_date FROM TBL_BOOKRENT WHERE RETURN_DATE IS null ;
-- 현재 연체 중인 회원의 이름 전화번호를 검색합니다. 오늘 날짜 sysdate 기준으로 확인하기
SELECT name, tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON tb.RETURN_DATE IS NULL AND bm.MEM_IDX = tb.MEM_IDX AND sysdate > exp_date;
-- 현재 대출중인 도서의 도서명코드와 도서명 조회합니다.
SELECT tb.BCODE, tb.TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND tb2.RETURN_DATE IS NULL;
-- 현재 도서를 대여한 회원의 idx와 회원이름을 검색합니다.
SELECT bm.mem_idx, name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON tb.RETURN_DATE IS NULL AND bm.MEM_IDX = tb.MEM_IDX;
-- 현재 연체 중인 도서의 회원IDX, 도서코드, 반납기한을 검색합니다.
SELECT mem_idx, bcode, exp_date FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL AND sysdate > EXP_DATE;
-- 대출중인 도서의 회원이름, 도서명, 반납기한 검색합니다.
SELECT bm.name, tc.title, tc.exp_date 
FROM BOOK_MEMBER bm JOIN 
(SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 ON tb.bcode=tb2.bcode WHERE tb2.RETURN_DATE IS null)tc 
ON bm.MEM_IDX = tc.mem_idx;

SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm, TBL_BOOK tb, TBL_BOOKRENT tb2
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE =tb2.BCODE AND tb2.return_date IS null;
-- 회원 idx'10002'는 도서대출이 가능한지 프로시저를 작성합니다.
DECLARE
	vcnt NUMBER;
BEGIN
	SELECT count(*) INTO vcnt
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10002 AND RETURN_DATE IS NULL;
	IF (vcnt = 0) then
		dbms_output.put_line('책 대여 가능합니다.');
	ELSE 
	dbms_output.put_line('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END;

CREATE OR REPLACE PROCEDURE check_member(
	arg_mem in book_member.MEM_IDX %TYPE,	-- 프로시저 실행할때 값을 받을 매개변수
	isOK OUT varchar2		-- 자바의 리턴값에 해당하는 부분.
)
IS 
	vcnt NUMBER;
	vname varchar2(100);
	BEGIN
		SELECT name 
		INTO vname -- 변수에 저장.
		FROM book_member bm WHERE mem_idx = arg_mem;
		SELECT count(*) INTO vcnt
		FROM TBL_BOOKRENT tb 
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;
		IF (vcnt = 0) then
			dbms_output.put_line('책 대여 가능합니다.');
			isOK := '가능';
		ELSE 
			dbms_output.put_line('대여 중인 책을 반납해야 가능합니다.');
			isOK := '불가능';
		END IF;
		EXCEPTION		-- 예외(오류)처리
		WHEN no_data_found THEN   
			DBMS_OUTPUT.PUT_LINE('없는 회원입니다.');	
			isOK := 'no match';
END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_member(10002, vresult);
	dbms_output.put_line('결과 : ' ||vresult);
END;

-- 도서명에 '페스트'라는 글자가 들어가는 도서를 검색하여 도서 대출이 가능한지 프로시저를 작성합니다.

DECLARE
	v_bcode varchar2(20);
	v_cnt NUMBER;
begin
	SELECT bcode INTO v_bcode FROM TBL_BOOK tb WHERE title = '페스트';
	SELECT count(*) INTO v_cnt FROM TBL_BOOKRENT tb2 WHERE bcode = v_bcode AND return_date IS NULL;
	IF (v_cnt=0) THEN
		dbms_output.put_line('책 대여 가능합니다.');
	ELSE
		dbms_output.put_line('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END;

CREATE OR REPLACE PROCEDURE check_book(
	arg_book IN tbl_book.BCODE %TYPE,
	isOK OUT varchar2
)
is
	v_bcode varchar2(20);
	v_cnt NUMBER;
	begin
		SELECT bcode INTO v_bcode FROM TBL_BOOK tb WHERE title = arg_book;
		SELECT count(*) INTO v_cnt FROM TBL_BOOKRENT tb2 WHERE bcode = v_bcode AND return_date IS NULL;
		IF (v_cnt=0) THEN
			dbms_output.put_line('책 대여 가능합니다.');
			isOK := 'TRUE';
		ELSE
			dbms_output.put_line('대여 중인 책을 반납해야 가능합니다.');
			ISOK := 'FALSE';
		END IF;
		EXCEPTION		-- 예외(오류)처리
		WHEN no_data_found THEN   
			DBMS_OUTPUT.PUT_LINE('찾는 책이 없습니다.');	
		isOK := 'no match';
END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_book('aa', vresult);
	dbms_output.put_line('결과 : ' || vresult);
END;




