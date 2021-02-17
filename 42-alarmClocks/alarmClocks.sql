CREATE PROCEDURE alarmClocks()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    DROP TABLE IF EXISTS output;
    CREATE TABLE output(alarm_date datetime);
    
    SET @initial_date = (SELECT input_date FROM userInput);
    SET @date = @initial_date;
    
    WHILE YEAR(@initial_date) = YEAR(@date) DO
        INSERT INTO output(alarm_date) SELECT @initial_date;
        SET @initial_date = DATE_ADD(@initial_date, INTERVAL 7 DAY);
       
    END WHILE;
    
    SELECT * FROM output;
END