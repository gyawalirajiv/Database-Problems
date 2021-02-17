CREATE PROCEDURE consecutiveIds()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @count := 0;
    SELECT id as oldId, @count := @count + 1
    FROM itemIds;
END