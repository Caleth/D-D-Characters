CREATE FUNCTION [Character].[Notes](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/Notes/text())[1]', 'varchar(max)')
END;