CREATE PROCEDURE habitatArea()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @p = (SELECT CONCAT('MULTIPOINT(',GROUP_CONCAT(x,' ',y),')') FROM places);
    SELECT ST_Area(ST_ConvexHull(ST_GeomFromText(@p))) AS area;
END