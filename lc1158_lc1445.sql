-- lc 1158

select Users.user_id as buyer_id, join_date, ifnull(count(order_id), 0) as orders_in_2019
from Users
left join (select * from Orders where order_date between '2019-01-01' and '2019-12-31') as B
on Users.user_id = B.buyer_id 
group by Users.user_id

-- lc 1445 apples and oranges
select a.sale_date, a.sold_num - o.sold_num as diff
from 
((select * from Sales where fruit = 'apples') a
join 
(select * from Sales where fruit = 'oranges') o
on a.sale_date = o.sale_date) 
