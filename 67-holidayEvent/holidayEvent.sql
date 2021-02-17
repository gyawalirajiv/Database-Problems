CREATE PROCEDURE holidayEvent()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @count := 0;
    SELECT DISTINCT buyer_name as winners FROM (
        SELECT buyer_name, @count := @count + 1 as counter
        FROM purchases
    ) AS counter_table
    WHERE MOD(counter_table.counter, 4) = 0
    ORDER BY buyer_name;
END