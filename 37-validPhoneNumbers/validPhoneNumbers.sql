CREATE PROCEDURE validPhoneNumbers()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM phone_numbers
    WHERE phone_number REGEXP '^((1-)|\\(1\\))[0-9]{3}-[0-9]{3}-[0-9]{4}$'
    ORDER BY surname;
END