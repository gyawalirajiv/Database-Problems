CREATE PROCEDURE driversInfo()
BEGIN
    /*order by two things: driver_name and date
    create names table and dates table, join on driver_name*/
    CREATE TABLE IF NOT EXISTS Names(
        min_date DATE,
        driver_name VARCHAR(20),
        name_info VARCHAR(100) 
    );
    
    INSERT INTO Names
    SELECT 
        (MIN(date) - INTERVAL 1 DAY) AS date,
        driver_name,
        CONCAT(' Name: ', driver_name, '; number of inspections: ', COUNT(*), '; miles driven: ', SUM(miles_logged)) AS name_info
        FROM inspections
        GROUP BY driver_name;
    
    CREATE TABLE IF NOT EXISTS Dates(
        inspection_date DATE,
        driver_name VARCHAR(20),
        inspection_info VARCHAR(100)
    );
    
    INSERT INTO Dates
    SELECT 
        date, 
        driver_name,
        CONCAT('  date: ', date, '; miles covered: ', miles_logged) AS inspection_info
    FROM inspections;
    
    SELECT CONCAT(' Total miles driven by all drivers combined: ', SUM(miles_logged)) AS summary
    FROM inspections
    UNION
    (SELECT info
    FROM
        (SELECT *
        FROM
            (SELECT min_date AS date, driver_name, name_info AS info FROM Names) AS t1
            UNION
            (SELECT inspection_date AS date, driver_name, inspection_info AS info FROM Dates)
        ORDER BY driver_name, date) AS t2);

    
    DROP TABLE Names;
    DROP TABLE Dates;
END