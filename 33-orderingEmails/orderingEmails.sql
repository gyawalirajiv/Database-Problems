CREATE PROCEDURE orderingEmails()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT id, email_title, 
        CASE
            WHEN size < 1024 THEN "0 Kb"
            WHEN size < (1024 * 1024) THEN CONCAT(FLOOR(size / 1024), ' Kb')
            ELSE CONCAT (FLOOR(size / (1024 * 1024)), ' Mb')
        END AS short_size
    FROM emails
    ORDER BY size DESC;
END