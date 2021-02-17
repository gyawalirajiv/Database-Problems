CREATE PROCEDURE correctIPs()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT * FROM ips
    WHERE IS_IPV4(ip) AND length(SUBSTRING_INDEX(ip, '.', -2)) > 3
    ORDER BY id;
END