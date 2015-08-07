
CREATE FUNCTION dbo.Reference_Source(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@source)[1]', 'varchar(max)')
END;