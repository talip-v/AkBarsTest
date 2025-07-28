SELECT clients.geography
FROM clients
GROUP BY geography
HAVING COUNT(DISTINCT cardtype) < (SELECT COUNT(DISTINCT clients.cardtype)
                                   FROM clients)