# lc 1148

select distinct author_id as id
from Views
where author_id = viewer_id
order by author_id ;



# 1407

select Users.name, ifnull(sum(Rides.distance), 0)  as travelled_distance
from Users
left join Rides on Users.id = Rides.user_id 
group by Users.id 
order by travelled_distance desc, Users.name; 


# 1527

select patient_id, patient_name, conditions
from Patients
where conditions like '% DIAB1%' or conditions like 'DIAB1%';


# 1587
select Users.name, sum(amount) as balance
from Users left join Transactions on Users.account = Transactions.account 
group by Users.name having balance > 10000;


# 1667
select user_id, concat(upper(substring(name, 1, 1)), lower(substring(name, 2))) as name
from Users
order by user_id;
