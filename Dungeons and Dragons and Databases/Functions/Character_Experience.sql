CREATE FUNCTION dbo.Character_Experience(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Experience/text())[1]', 'varchar(max)')
END;