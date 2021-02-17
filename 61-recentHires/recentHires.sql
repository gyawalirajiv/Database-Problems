CREATE PROCEDURE recentHires()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT name FROM (
        (SELECT name, 1 AS filter FROM (SELECT name FROM pr_department ORDER BY date_joined DESC LIMIT 5) AS filtered_pr ORDER BY name)
        UNION ALL
        (SELECT name, 2 AS filter FROM (SELECT name FROM it_department ORDER BY date_joined DESC LIMIT 5) AS filtered_it ORDER BY name)
        UNION ALL
        (SELECT name, 3 AS filter FROM (SELECT name FROM sales_department ORDER BY date_joined DESC LIMIT 5) AS filtered_sales ORDER BY name)
    ) AS unified
    ORDER BY filter, name
    ;
END