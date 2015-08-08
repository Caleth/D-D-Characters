CREATE FUNCTION [Character].[Wisdom](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Wisdom/@score)[1]', 'varchar(max)')
END;