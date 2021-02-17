CREATE PROCEDURE suspectsInvestigation2()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT id, name, surname FROM Suspect
    WHERE height <= 170 OR LOWER(SUBSTRING(name, 1, 1)) NOT LIKE 'b' OR LOWER(surname) NOT LIKE 'gre_n';
END