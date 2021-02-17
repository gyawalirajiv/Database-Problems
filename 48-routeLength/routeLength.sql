CREATE PROCEDURE routeLength()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT
        ROUND(SUM(SQRT(POWER(c1.x - c2.x, 2) + POWER(c1.y - c2.y, 2))), 9) total
    FROM cities c1
    INNER JOIN cities c2 ON 1=1
        AND c1.id = c2.id - 1;
END