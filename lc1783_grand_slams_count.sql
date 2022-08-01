-- lc 1783 : grand slams titles

-- Solution 1: use cross_join

select player_id, player_name, 
    sum((player_id = Wimbledon) + (player_id = Fr_open) + (player_id = US_open) + (player_id = Au_open)) as grand_slams_count
from Players cross join Championships 
group by player_id, player_name
having grand_slams_count > 0;


-- Solution 2: use inner join
select player_id, player_name, 
    sum((player_id = Wimbledon) + (player_id = Fr_open) + (player_id = US_open) + (player_id = Au_open)) as grand_slams_count
from Players inner join Championships
on (player_id = Wimbledon) or (player_id = Fr_open) or (player_id = US_open) or (player_id = Au_open)
group by player_id, player_name; 


