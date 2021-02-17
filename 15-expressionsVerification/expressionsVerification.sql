CREATE PROCEDURE expressionsVerification()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM expressions
    WHERE (operation LIKE '+' && a + b = c) 
    || (operation LIKE '-' && a - b = c)
    || (operation LIKE '*' && a * b = c)
    || (operation LIKE '/' && a / b = c);
END