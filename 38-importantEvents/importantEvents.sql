CREATE PROCEDURE importantEvents()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM events
    ORDER BY WEEKDAY(event_date), participants DESC; 
END