--1393. Capital Gain/Loss



with cte as (
    select stock_name, 
           case when operation = "Buy" then -price
           else price
           end as signed_price
    from Stocks)
select stock_name, sum(signed_price) as capital_gain_loss
from cte
group by stock_name; 
