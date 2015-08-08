CREATE FUNCTION [Character].[Alignment](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Alignment/text())[1]', 'varchar(max)')
END;