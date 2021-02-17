CREATE PROCEDURE itemCounts()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT item_name, item_type, count(*) FROM availableItems
    GROUP BY item_type, item_name
    ORDER BY item_type, item_name;
END