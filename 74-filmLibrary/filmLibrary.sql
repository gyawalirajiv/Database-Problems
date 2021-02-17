CREATE PROCEDURE filmLibrary()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @max_genre = (SELECT genre FROM movies
    GROUP BY genre
    ORDER BY COUNT(*) DESC LIMIT 1);
    
    SELECT starring_actors.actor as actor, actor_ages.age as age
    FROM starring_actors JOIN actor_ages
    ON starring_actors.actor = actor_ages.actor
    WHERE movie_name IN (SELECT movie FROM movies WHERE genre = @max_genre)
    ORDER BY age DESC, actor;
END