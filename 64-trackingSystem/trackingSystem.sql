CREATE PROCEDURE trackingSystem()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT DISTINCT anonymous_id as anonym_id, 
    (
        SELECT event_name FROM tracks
        WHERE anonymous_id = anonym_id AND user_id IS NULL
        ORDER BY received_at DESC
        LIMIT 1
    ) AS last_null,
    (
        SELECT event_name FROM tracks
        WHERE anonymous_id = anonym_id AND user_id IS NOT NULL
        ORDER BY received_at
        LIMIT 1
    ) AS first_notnull
    FROM tracks
    ORDER BY anonym_id;
END