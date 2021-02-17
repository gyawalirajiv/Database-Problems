CREATE PROCEDURE unluckyEmployees()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SET @count := 0;
    
    SELECT dep_name, emp_number, total_salary FROM (
        SELECT dep_name, emp_number, IF(total_salary IS NULL, 0, total_salary) AS total_salary, @count := @count + 1 as counter FROM (
            SELECT name AS dep_name, IF(department IS NULL, 0, COUNT(department)) AS emp_number, SUM(salary) AS total_salary FROM Department
            LEFT JOIN Employee
            ON Department.id = Employee.department
            GROUP BY Department.id
            HAVING emp_number <= 5
            ORDER BY total_salary DESC, emp_number DESC, Department.id
        ) AS filtered_table
    ) AS counter_table
    WHERE counter_table.counter % 2 = 1
    ;
END