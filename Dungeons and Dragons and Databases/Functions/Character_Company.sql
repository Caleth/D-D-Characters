CREATE FUNCTION dbo.Character_Company(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Company/text())[1]', 'varchar(max)')
END;