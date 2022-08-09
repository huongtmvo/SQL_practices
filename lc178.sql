178. Rank Scores

Table: Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+


select score, dense_rank() over(order by score desc) as 'rank'
from Scores;
