CREATE FUNCTION dbo.Reference_Name(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@name)[1]', 'varchar(max)')
END;