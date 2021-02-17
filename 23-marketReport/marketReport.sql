CREATE PROCEDURE marketReport()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    (SELECT country, COUNT(*) as 'competitors' FROM foreignCompetitors
    GROUP BY country ORDER BY country LIMIT 100)
    UNION
    SELECT 'Total:' as country, COUNT(*) as 'competitors' FROM foreignCompetitors;
END