--lc 2308. Arrange Table by Gender

WITH cte
     AS (SELECT user_id,
                gender,
                row_number() OVER (partition BY gender ORDER BY user_id) AS id_order,
                CASE gender
                  WHEN 'female' THEN 1
                  WHEN 'other' THEN 2
                  ELSE 3
                END AS gender_order
         FROM Genders)
SELECT user_id,
       gender
FROM   cte
ORDER BY id_order, gender_order