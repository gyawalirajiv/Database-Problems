CREATE PROCEDURE placesOfInterest()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT country, 
        SUM(CASE WHEN leisure_activity_type LIKE 'Adventure park' THEN number_of_places ELSE 0 END) AS adventure_park, 
        SUM(CASE WHEN leisure_activity_type LIKE 'Golf' THEN number_of_places ELSE 0 END) AS golf, 
        SUM(CASE WHEN leisure_activity_type LIKE 'River cruise' THEN number_of_places ELSE 0 END) AS river_cruise, 
        SUM(CASE WHEN leisure_activity_type LIKE 'Kart racing' THEN number_of_places ELSE 0 END) AS kart_racing
    FROM countryActivities
    GROUP BY country
    ORDER BY country;
END