CREATE PROCEDURE salaryDifference()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    -- SELECT 
    --     CASE
    --         WHEN (max_total_table.max_total - min_total_table.min_total) IS NULL THEN 0
    --         ELSE (max_total_table.max_total - min_total_table.min_total)
    --     END AS salary_diff 
    -- FROM (
    --     SELECT max_salary * COUNT(*) as max_total FROM (
    --         SELECT MAX(salary) as max_salary FROM employees
    --     ) AS max_table, employees 
    --     WHERE salary = max_salary
    -- ) AS max_total_table,
    -- (
    --     SELECT min_salary * COUNT(*) as min_total FROM (
    --         SELECT MIN(salary) as min_salary FROM employees
    --     ) AS min_table, employees 
    --     WHERE salary = min_salary
    -- ) AS min_total_table;
    
    SET @maxSalary = (SELECT MAX(salary) FROM employees);
    SET @maxTotalSalary = (SELECT COUNT(*) FROM employees WHERE salary = @maxSalary) * @maxSalary;
    
    SET @minSalary = (SELECT MIN(salary) FROM employees);
    SET @minTotalSalary = (SELECT COUNT(*) FROM employees WHERE salary = @minSalary) * @minSalary;
    
    SELECT 
        CASE
            WHEN (@maxTotalSalary - @minTotalSalary) IS NULL THEN 0
            ELSE(@maxTotalSalary - @minTotalSalary)
        END AS salary_diff;
END