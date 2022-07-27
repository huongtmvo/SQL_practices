# lc 2026
select problem_id 
from Problems
where likes/(likes + dislikes) < 0.6
order by problem_id; 


# lc 2072
select 
    case 
        when (select count(*) from NewYork where score >= 90) > (select count(*) from California where score >= 90) then 'New York University'
        when (select count(*) from NewYork where score >= 90) < (select count(*) from California where score >= 90) then 'California University'
        else 'No Winner'
    end as winner;
    
