SELECT cardtype, ROUND(100.0 * SUM(exited)/COUNT(*), 2) AS ExitPercent
FROM clients
GROUP BY cardtype