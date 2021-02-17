CREATE PROCEDURE securityBreach()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM users
    WHERE BINARY attribute LIKE CONCAT('_%', '\%', first_name, '\_', second_name, '\%', '%');
END