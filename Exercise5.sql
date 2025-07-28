WITH t1 AS (
    SELECT geography,
           Gender,
           estimatedsalary,
           row_number() over (PARTITION BY geography ORDER BY estimatedsalary DESC) AS row_num
    FROM clients
), t2 AS (
    SELECT geography,
           SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS female_count,
           SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS male_count
    FROM t1
    WHERE row_num <= 10
    GROUP BY geography
)
SELECT geography FROM t2
WHERE female_count > male_count