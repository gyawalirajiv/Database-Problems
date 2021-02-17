CREATE PROCEDURE countriesSelection()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * from countries where continent = 'Africa' ORDER BY name;
END