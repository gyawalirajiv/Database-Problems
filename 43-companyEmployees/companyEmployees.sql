CREATE PROCEDURE companyEmployees()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT dep_name, emp_name 
    FROM departments JOIN employees
    ORDER BY dep_name, emp_name;
END