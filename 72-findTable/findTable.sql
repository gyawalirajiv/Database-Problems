CREATE PROCEDURE findTable()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT 
        DISTINCT filtered_columns.table_name as tab_name, 
        filtered_columns.column_name as col_name, 
        filtered_columns.data_type as data_types
    FROM information_schema.columns filtered_columns  
    JOIN (
        SELECT table_name FROM information_schema.tables
        WHERE table_name LIKE BINARY 'e%s'
    ) AS filtered_tables
    ON filtered_tables.table_name = filtered_columns.table_name
    WHERE filtered_columns.table_schema = 'ri_db'
    ORDER BY tab_name, col_name;
END