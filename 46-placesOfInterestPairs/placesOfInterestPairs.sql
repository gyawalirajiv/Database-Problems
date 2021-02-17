CREATE PROCEDURE placesOfInterestPairs()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT a.name, b.name
    FROM sights a JOIN sights b ON a.name < b.name
    WHERE ST_DISTANCE(POINT(a.x, a.y), POINT(b.x, b.y)) < 5
    ORDER BY a.name, b.name;
END