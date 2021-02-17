CREATE PROCEDURE suspectsInvestigation()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT id, name, surname FROM Suspect
    WHERE height <= 170 && LOWER(SUBSTR(name, 1, 1)) LIKE 'b' && LOWER(surname) LIKE 'gre_n'
    ORDER BY id;
END