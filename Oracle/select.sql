select * from member_tbl_02;
select * from money_tbl_02;

-- ȸ��������ȸ ���ΰ� group by

select mt.custno ȸ����ȣ, custname ȸ������,decode(grade, 'A', 'VIP', 'B', '�Ϲ�','C','����') �����, asum ����
from member_tbl_02 mt, (select custno, sum(price) as asum from money_tbl_02
group by custno order by asum desc) sale
where mt.custno = sale.custno;

select mt.custno ȸ����ȣ, custname ȸ������,decode(grade, 'A', 'VIP', 'B', '�Ϲ�','C','����') �����, asum ����
from member_tbl_02 mt join
(select custno, sum(price) as asum from money_tbl_02
group by custno
order by asum desc) sale
on mt.custno = sale.custno;
