CREATE PROCEDURE booksCatalogs()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT EXTRACTVALUE(xml_doc, '/catalog/book[1]/author') as author
    FROM catalogs ORDER BY author;
END