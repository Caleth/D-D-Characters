CREATE FUNCTION [Character].[Companions](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Companions/text())[1]', 'varchar(max)')
END;