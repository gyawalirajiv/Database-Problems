CREATE PROCEDURE queriesExecution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @a = CONCAT(
        (SELECT GROUP_CONCAT(
            CONCAT('select "',
                query_name,
                '" query_name, (',
                code,
                ') val')
            SEPARATOR ' union ') FROM queries),
        ' order by 1');
    PREPARE qry FROM @a;
    EXECUTE qry;
END