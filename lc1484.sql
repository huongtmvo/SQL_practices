# lc 1484

# Note: the default separator of group_concat is ',' so no need to specify the separator if using ','

select sell_date, count(distinct product) as num_sold, 
        group_concat(distinct product order by product) as products
from Activities
group by sell_date

# OR to specify

select sell_date, count(distinct product) as num_sold, GROUP_CONCAT(distinct product order by product ASC SEPARATOR ',') as products 
from Activities 
group by sell_date 

