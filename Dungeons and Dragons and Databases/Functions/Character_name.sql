CREATE FUNCTION dbo.Character_name(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/name/text())[1]', 'varchar(max)')
END;