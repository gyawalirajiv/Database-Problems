CREATE PROCEDURE nullIntern()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT COUNT(*) as number_of_nulls FROM departments
    WHERE description IS NULL
    OR LOWER(TRIM(description)) = 'NULL'
    OR LOWER(TRIM(description)) = 'nil'
    OR LOWER(TRIM(description)) = '-';
END