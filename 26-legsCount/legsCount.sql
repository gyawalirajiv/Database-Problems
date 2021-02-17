DROP PROCEDURE IF EXISTS legsCount;
CREATE PROCEDURE legsCount()
    SELECT 
        (COUNT(type) * 4 - (SELECT COUNT(type) * 2 FROM creatures WHERE type = 'human')) as summary_legs
    FROM creatures
    ORDER BY id;
