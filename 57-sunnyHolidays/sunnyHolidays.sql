CREATE PROCEDURE sunnyHolidays()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT holiday_date as ski_date FROM holidays
    WHERE holiday_date IN (
        SELECT * FROM weather
    );
END