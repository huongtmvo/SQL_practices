1596. The Most Frequently Ordered Products for Each Customer

-- Solution: use dense_rank() and partition by

select a.customer_id, a.product_id, b.product_name
from 
(
    select customer_id, product_id, 
            dense_rank() over(partition by customer_id order by count(*) desc) as prank
    from Orders
    group by customer_id, product_id
 ) a
 inner join Products b
 on a.product_id = b.product_id
 where prank = 1
 order by a.customer_id ; 
 
