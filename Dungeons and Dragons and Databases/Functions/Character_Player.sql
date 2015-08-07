CREATE FUNCTION dbo.Character_Player(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Player/text())[1]', 'varchar(max)')
END;