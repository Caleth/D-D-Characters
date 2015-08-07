CREATE FUNCTION dbo.Character_Appearance(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Appearance/text())[1]', 'varchar(max)')
END;