CREATE PROCEDURE localCalendar()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT event_id, 
        CASE 
            WHEN hours = 12 THEN DATE_FORMAT(DATE_ADD(date, INTERVAL timeshift MINUTE), '%Y-%m-%d %h:%i %p')
            ELSE DATE_FORMAT(DATE_ADD(date, INTERVAL timeshift MINUTE), '%Y-%m-%d %H:%i')
        END AS formatted_date
    FROM events JOIN settings ON events.user_id = settings.user_id
    ORDER BY event_id;
END