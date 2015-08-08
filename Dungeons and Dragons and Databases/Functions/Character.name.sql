CREATE FUNCTION [Character].[Name](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/name/text())[1]', 'varchar(max)')
END;