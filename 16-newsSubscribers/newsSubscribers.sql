CREATE PROCEDURE newsSubscribers()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT subscriber FROM full_year WHERE newspaper LIKE '%Daily%'
    UNION
    SELECT subscriber FROM half_year WHERE newspaper LIKE '%Daily%' ORDER BY subscriber;
END