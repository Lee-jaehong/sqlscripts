-- select �⺻����
-- select �÷�1, �÷�2,... from ���̺�� where �˻����ǽ�
-- 				order by �����÷� (�⺻ ���� : asc, ����: desc)
SELECT * FROM TBL_BUY tb ;			--INSERT ������ ��� ���
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_buy ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_buy WHERE CUSTOM_ID = 'mina012' ;
SELECT * FROM TBL_buy WHERE CUSTOM_ID = 'mina012'
				ORDER BY buy_date DESC;		--WHERE, ORDER BY ���� �Դϴ�.
-- ��ȸ�� �÷� ������ �� distinct Ű���� : �ߺ����� 1���� ��� ���.
SELECT custom_id FROM TBL_BUY tb ;		-- ���Ű� id ��ȸ		
SELECT DISTINCT custom_id FROM TBL_BUY tb ;		-- �ߺ����� 1����				
				
