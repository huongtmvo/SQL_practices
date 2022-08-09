2112. The Airport With the Most Traffic

with t as (
    select departure_airport as airport_id, sum(flights_count) as count from Flights group by airport_id 
    union 
    (select arrival_airport as airport_id, sum(flights_count) as count from Flights group by airport_id)
    ) 
    select airport_id 
    from t 
    group by airport_id 
    having sum(count) = (select sum(count) 
                         from t 
                         group by airport_id 
                         order by sum(count) 
                         desc limit 1);