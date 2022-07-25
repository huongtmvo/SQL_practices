# lc 1082
select seller_id from Sales group by seller_id having sum(price) = 
    (select sum(price) from Sales group by seller_id order by sum(price) desc limit 1);
    
# lc 1083

select distinct buyer_id 
from Sales
inner join Product on Sales.product_id = Product.product_id
group by buyer_id 
having sum(Product.product_name = 'S8') > 0 and sum(Product.product_name = 'iPhone') = 0;
   
 
# lc 1084

select Product.product_id, Product.product_name 
from Product 
join Sales on Product.product_id = Sales.product_id
group by Product.product_id
having  min(sale_date) >= cast('2019-01-01' as date) 
        and max(sale_date) <= cast('2019-03-31' as date) ;
        

SELECT product_id, product_name 
FROM Product 
WHERE product_id IN
(SELECT product_id
FROM Sales
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31')

select s.product_id, p.product_name
from sales s, product p
where s.product_id = p.product_id
group by s.product_id, p.product_name
having min(s.sale_date) >= '2019-01-01' 
    and max(s.sale_date) <= '2019-03-31'
    
