CREATE PROCEDURE storageOptimization()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM (
        SELECT id, 'name' as column_name, name as value
        FROM workers_info
        WHERE name IS NOT NULL
        UNION
        SELECT id, 'date_of_birth' as column_name, date_of_birth as value
        FROM workers_info
        WHERE date_of_birth IS NOT NULL
        UNION
        SELECT id, 'salary' as column_name, salary as value
        FROM workers_info
        WHERE salary IS NOT NULL
    ) as union_table
    ORDER BY id, FIELD(column_name, 'name', 'date_of_birth', 'salary');
END