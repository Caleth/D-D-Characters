CREATE FUNCTION [Character].[Weight](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Weight/text())[1]', 'varchar(max)')
END;