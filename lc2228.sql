2228. Users With Two Purchases Within Seven Days

Table: Purchases
+---------------+------+
| Column Name   | Type |
+---------------+------+
| purchase_id   | int  |
| user_id       | int  |
| purchase_date | date |
+---------------+------+
 
Write an SQL query to report the IDs of the users that made any two purchases at most 7 days apart.
Return the result table ordered by user_id.


-- Solution: 
with cte 
as (select a.user_id, a.purchase_date as first, b.purchase_date as second  
    from purchases a join purchases b  on a.user_id = b.user_id 
    and a.purchase_id != b.purchase_id 
    and a.purchase_date <= b.purchase_date) 
    
select distinct(user_id) from cte where datediff(second, first) <= 7 order by user_id;
