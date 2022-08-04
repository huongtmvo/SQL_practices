550. Game Play Analysis IV

-- Solution:
with cte 
as 
    (select player_id, min(event_date) as start_date
     from Activity group by player_id)
select 
    round((count(distinct cte.player_id))/(select count(distinct player_id) from Activity), 2) as fraction
from Activity a join cte
on a.player_id = cte.player_id
and cte.start_date = date_sub(a.event_date, interval 1 day) ; 

-- can also use datediff            
and datediff(cte.start_date, a.event_date) = -1
                 
     