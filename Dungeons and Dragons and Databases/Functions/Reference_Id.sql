
CREATE FUNCTION dbo.Reference_Id(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@internal-id)[1]', 'varchar(max)')
END;