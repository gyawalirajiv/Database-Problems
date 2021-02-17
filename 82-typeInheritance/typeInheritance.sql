/*Please add ; after each select statement*/
CREATE PROCEDURE typeInheritance()
SELECT var_name, type var_type
FROM variables
WHERE a(type);



CREATE FUNCTION a( c TEXT ) RETURNS INT
LOOP
    SET c=(SELECT base FROM inheritance WHERE derived=c);
    IF c IS NULL OR c = 'NUMBER' THEN
        RETURN ORD(c);
    END IF;
END LOOP