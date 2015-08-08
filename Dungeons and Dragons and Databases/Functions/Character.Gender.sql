CREATE FUNCTION [Character].[Gender](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Gender/text())[1]', 'varchar(max)')
END;