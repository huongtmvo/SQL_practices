# lc 1327

select product_name, sum(unit) as unit
from Products join Orders on Products.product_id = Orders.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by Products.product_id
having sum(unit) >= 100;


# lc 1303
select employee_id, team_size
from Employee
left join 
(select team_id, count(*) as team_size
from Employee 
group by team_id) as Teams on Employee.team_id = Teams.team_id  ;

# lc 1173

select round((select count(*) from Delivery
where customer_pref_delivery_date = order_date)/(select count(*) from Delivery) *100, 2) 
as 'immediate_percentage' ;
