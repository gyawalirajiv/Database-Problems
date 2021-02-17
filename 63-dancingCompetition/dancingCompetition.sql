CREATE PROCEDURE dancingCompetition()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT arbiter_id, first_criterion, second_criterion, third_criterion FROM (
        SELECT arbiter_id, first_criterion, second_criterion, third_criterion,
        (
            IF(first_criterion = (SELECT MAX(first_criterion) FROM scores)
            OR first_criterion = (SELECT MIN(first_criterion) FROM scores), 1, 0)
            +
            IF(second_criterion = (SELECT MAX(second_criterion) FROM scores)
            OR second_criterion = (SELECT MIN(second_criterion) FROM scores), 1, 0)
            + 
            IF(third_criterion = (SELECT MAX(third_criterion) FROM scores)
            OR third_criterion = (SELECT MIN(third_criterion) FROM scores), 1, 0)
        ) AS filter
        FROM scores
    ) AS filtered_table
    WHERE filtered_table.filter <= 1;
END