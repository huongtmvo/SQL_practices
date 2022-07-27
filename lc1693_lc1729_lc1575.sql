# lc 1693

select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name;

# 1729 
select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id;

# 1575
select product_id from Products
where low_fats = 'Y' and recyclable = 'Y';

