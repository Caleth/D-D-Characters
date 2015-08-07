CREATE FUNCTION dbo.Character_Height(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Height/text())[1]', 'varchar(max)')
END;