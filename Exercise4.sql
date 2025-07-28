WITH t1 AS (
    SELECT geography, ROUND(AVG(clients.estimatedsalary), 2) AS AvgSalary
    FROM clients
    GROUP BY geography
)
SELECT clients.customerid, clients.surname, clients.geography, clients.estimatedsalary, AvgSalary
FROM clients
JOIN t1 ON t1.geography = clients.geography