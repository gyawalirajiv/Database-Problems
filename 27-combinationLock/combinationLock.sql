CREATE PROCEDURE combinationLock()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @count = 1;
    SELECT MAX(@count := @count * LENGTH(characters)) as combinations FROM discs;
END