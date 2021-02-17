CREATE PROCEDURE travelDiary()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT GROUP_CONCAT(DISTINCT country ORDER BY country) as countries FROM diary;
END