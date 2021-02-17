CREATE PROCEDURE gradeDistribution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT Name, ID from Grades 
    WHERE Final > (Midterm1*0.25 + Midterm2*0.25 + Final*0.5) && Final > (Midterm1*0.5 + Midterm2*0.5) 
    ORDER BY SUBSTRING(NAME, 1, 3), ID;
END