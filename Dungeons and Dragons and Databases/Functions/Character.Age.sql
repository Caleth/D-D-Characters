CREATE FUNCTION [Character].[Age](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Age/text())[1]', 'varchar(max)')
END;