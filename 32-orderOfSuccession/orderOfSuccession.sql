CREATE PROCEDURE orderOfSuccession()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT 
    CASE
        WHEN(gender LIKE 'M') THEN CONCAT('King ', name) 
        ELSE CONCAT('Queen ', name)
    END AS name
    FROM Successors
    ORDER BY birthday;
END