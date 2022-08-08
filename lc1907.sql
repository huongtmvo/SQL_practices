-- leetcode 1907
1907. Count Salary Categories

select "Low Salary" as category, count(*) as accounts_count from Accounts where income < 20000
union 
select "Average Salary" as category, count(*) as accounts_count from Accounts where 20000 <= income and income <= 50000
union
select "High Salary" as category, count(*) as accounts_count from Accounts where 50000 < income