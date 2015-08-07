CREATE FUNCTION dbo.Character_Portrait(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Portrait/text())[1]', 'varchar(max)')
END;