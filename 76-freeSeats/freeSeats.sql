CREATE PROCEDURE freeSeats()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT 
    flights.flight_id AS flight_id, 
    CASE
        WHEN planes.number_of_seats - purchases_count_table.reserved_count IS NULL THEN planes.number_of_seats
        ELSE planes.number_of_seats - purchases_count_table.reserved_count
    END AS free_seats
    FROM flights
    LEFT JOIN (
        SELECT *, COUNT(*) as reserved_count FROM purchases
        GROUP BY flight_id
    ) AS purchases_count_table
    ON flights.flight_id = purchases_count_table.flight_id
    JOIN planes 
    ON planes.plane_id = flights.plane_id
    ORDER BY flights.flight_id;
END