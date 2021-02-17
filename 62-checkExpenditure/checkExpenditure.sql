CREATE PROCEDURE checkExpenditure()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT filtered_table.id, 
        CASE
            WHEN SUM(filtered_table.expenditure_sum) > filtered_table.value THEN SUM(filtered_table.expenditure_sum) - filtered_table.value
            ELSE 0
        END AS loss
    FROM (
        SELECT ae.id, left_bound, right_bound, ae.value, monday_date, expenditure_sum
        FROM allowable_expenditure ae JOIN expenditure_plan ep ON 
        WEEK(monday_date, 2) >= left_bound
        AND
        WEEK(monday_date, 2) <= right_bound
    ) AS filtered_table
    GROUP BY id;
END