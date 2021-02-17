CREATE PROCEDURE dateFormatting()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT DATE_FORMAT(date_str, '%Y-%m-%d') as date_iso
    FROM documents;
END