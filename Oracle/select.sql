select * from member_tbl_02;
select * from money_tbl_02;

-- 회원매출조회 조인과 group by

select mt.custno 회원번호, custname 회원성명,decode(grade, 'A', 'VIP', 'B', '일반','C','직원') 고객등급, asum 매출
from member_tbl_02 mt, (select custno, sum(price) as asum from money_tbl_02
group by custno order by asum desc) sale
where mt.custno = sale.custno;

select mt.custno 회원번호, custname 회원성명,decode(grade, 'A', 'VIP', 'B', '일반','C','직원') 고객등급, asum 매출
from member_tbl_02 mt join
(select custno, sum(price) as asum from money_tbl_02
group by custno
order by asum desc) sale
on mt.custno = sale.custno;
