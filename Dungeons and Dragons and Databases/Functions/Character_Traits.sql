CREATE FUNCTION dbo.Character_Traits(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Traits/text())[1]', 'varchar(max)')
END;