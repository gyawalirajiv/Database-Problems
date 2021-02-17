CREATE PROCEDURE emptyDepartments()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT dep_name FROM departments
    WHERE dep_name NOT IN (
        SELECT dep_name FROM departments
        JOIN employees ON departments.id = employees.department
    );
END