CREATE FUNCTION [Character].[Constitution](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Constitution/@score)[1]', 'varchar(max)')
END;