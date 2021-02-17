DROP FUNCTION IF EXISTS response;
CREATE FUNCTION response(name VARCHAR(40)) RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    SET @firstName = LOWER(SUBSTRING_INDEX(name, ' ', 1));
    SET @lastName = LOWER(SUBSTRING_INDEX(name, ' ', -1));
    SET @firstName = CONCAT(UPPER(SUBSTR(@firstName, 1, 1)), SUBSTR(@firstName, 2));
    SET @lastName = CONCAT(UPPER(SUBSTR(@lastName, 1, 1)), SUBSTR(@lastName, 2));
    
    RETURN CONCAT("Dear ", @firstName, " ", @lastName, "! We received your message and will process it as soon as possible. Thanks for using our service. FooBar On! - FooBarIO team.");
END;

CREATE PROCEDURE customerMessages()
BEGIN
    SELECT id, name, response(name) AS response
    FROM customers;
END;
