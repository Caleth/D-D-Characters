
CREATE FUNCTION dbo.Reference_Type(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@type)[1]', 'varchar(max)')
END;