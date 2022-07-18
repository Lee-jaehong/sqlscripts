INSERT INTO TBL_BOOK VALUES ('B1102', '��Ʈ����ũ ������','��ö��','KBO','2020-11-10');
-- �ݳ��� ������ ��ü�ϼ� ����Ͽ� delay_date ������Ʈ�ϱ�
UPDATE TBL_BOOKRENT SET delay_days = RETURN_DATE - EXP_DATE  WHERE  RETURN_DATE IS NOT NULL;
-- �������� ������ ��ü�ϼ� ����ؼ� ȸ��idx, �����ڵ�, ��ü�ϼ� ��ȸ�ϱ�
SELECT mem_idx, bcode, trunc(sysdate) - exp_date FROM TBL_BOOKRENT WHERE RETURN_DATE IS null ;
-- ���� ��ü ���� ȸ���� �̸� ��ȭ��ȣ�� �˻��մϴ�. ���� ��¥ sysdate �������� Ȯ���ϱ�
SELECT name, tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON tb.RETURN_DATE IS NULL AND bm.MEM_IDX = tb.MEM_IDX AND sysdate > exp_date;
-- ���� �������� ������ �������ڵ�� ������ ��ȸ�մϴ�.
SELECT tb.BCODE, tb.TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND tb2.RETURN_DATE IS NULL;
-- ���� ������ �뿩�� ȸ���� idx�� ȸ���̸��� �˻��մϴ�.
SELECT bm.mem_idx, name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON tb.RETURN_DATE IS NULL AND bm.MEM_IDX = tb.MEM_IDX;
-- ���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�.
SELECT mem_idx, bcode, exp_date FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL AND sysdate > EXP_DATE;
-- �������� ������ ȸ���̸�, ������, �ݳ����� �˻��մϴ�.
SELECT bm.name, tc.title, tc.exp_date 
FROM BOOK_MEMBER bm JOIN 
(SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 ON tb.bcode=tb2.bcode WHERE tb2.RETURN_DATE IS null)tc 
ON bm.MEM_IDX = tc.mem_idx;

SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm, TBL_BOOK tb, TBL_BOOKRENT tb2
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE =tb2.BCODE AND tb2.return_date IS null;
-- ȸ�� idx'10002'�� ���������� �������� ���ν����� �ۼ��մϴ�.
DECLARE
	vcnt NUMBER;
BEGIN
	SELECT count(*) INTO vcnt
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10002 AND RETURN_DATE IS NULL;
	IF (vcnt = 0) then
		dbms_output.put_line('å �뿩 �����մϴ�.');
	ELSE 
	dbms_output.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END;

CREATE OR REPLACE PROCEDURE check_member(
	arg_mem in book_member.MEM_IDX %TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
	isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
)
IS 
	vcnt NUMBER;
	vname varchar2(100);
	BEGIN
		SELECT name 
		INTO vname -- ������ ����.
		FROM book_member bm WHERE mem_idx = arg_mem;
		SELECT count(*) INTO vcnt
		FROM TBL_BOOKRENT tb 
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;
		IF (vcnt = 0) then
			dbms_output.put_line('å �뿩 �����մϴ�.');
			isOK := '����';
		ELSE 
			dbms_output.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
			isOK := '�Ұ���';
		END IF;
		EXCEPTION		-- ����(����)ó��
		WHEN no_data_found THEN   
			DBMS_OUTPUT.PUT_LINE('���� ȸ���Դϴ�.');	
			isOK := 'no match';
END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_member(10002, vresult);
	dbms_output.put_line('��� : ' ||vresult);
END;

-- ������ '�佺Ʈ'��� ���ڰ� ���� ������ �˻��Ͽ� ���� ������ �������� ���ν����� �ۼ��մϴ�.

DECLARE
	v_bcode varchar2(20);
	v_cnt NUMBER;
begin
	SELECT bcode INTO v_bcode FROM TBL_BOOK tb WHERE title = '�佺Ʈ';
	SELECT count(*) INTO v_cnt FROM TBL_BOOKRENT tb2 WHERE bcode = v_bcode AND return_date IS NULL;
	IF (v_cnt=0) THEN
		dbms_output.put_line('å �뿩 �����մϴ�.');
	ELSE
		dbms_output.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
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
			dbms_output.put_line('å �뿩 �����մϴ�.');
			isOK := 'TRUE';
		ELSE
			dbms_output.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
			ISOK := 'FALSE';
		END IF;
		EXCEPTION		-- ����(����)ó��
		WHEN no_data_found THEN   
			DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');	
		isOK := 'no match';
END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_book('aa', vresult);
	dbms_output.put_line('��� : ' || vresult);
END;




