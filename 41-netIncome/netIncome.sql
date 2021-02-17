CREATE PROCEDURE netIncome()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT YEAR(date) as year, QUARTER(date) as quarter, SUM(profit) - SUM(loss) as net_profit
    FROM accounting
    GROUP BY year, quarter
    ORDER BY year, quarter;
END