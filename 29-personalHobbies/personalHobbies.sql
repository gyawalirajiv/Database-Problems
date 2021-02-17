CREATE PROCEDURE personalHobbies()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT name FROM people_hobbies 
    WHERE hobbies LIKE '%reading%%sports%';
END