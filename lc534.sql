534. Game Play Analysis III

--- Solution 1: Using Window function.

select player_id, event_date, 
       sum(games_played) over (partition by player_id order by event_date) as games_played_so_far
from Activity

-- Solution 2: Using Self join

select a.player_id, a.event_date, sum(b.games_played) as games_played_so_far
from activity a join activity b
on a.player_id = b.player_id
where a.event_date >= b.event_date
group by a.player_id, a.event_date
order by a.player_id;

