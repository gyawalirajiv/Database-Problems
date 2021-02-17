CREATE PROCEDURE top5AverageGrade()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT FORMAT(SUM(grade) / 5, 2) as average_grade FROM (
        SELECT grade FROM students
        ORDER BY grade DESC LIMIT 5
    ) AS sortedTable;
END