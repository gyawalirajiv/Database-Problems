CREATE PROCEDURE scholarshipsDistribution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT candidate_id
    FROM candidates LEFT JOIN detentions ON student_id = candidate_id
    WHERE student_id IS NULL
    ORDER BY candidate_id;
END