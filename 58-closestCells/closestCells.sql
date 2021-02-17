CREATE PROCEDURE closestCells()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT p1.id as id1, (
        SELECT id FROM positions p2
        WHERE p1.id != p2.id
        ORDER BY POWER(p1.x - p2.x, 2) + POWER(p1.y - p2.y, 2) LIMIT 1
    ) AS id2 
    FROM positions p1;
END