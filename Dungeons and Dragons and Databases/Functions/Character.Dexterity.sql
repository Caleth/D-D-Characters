CREATE FUNCTION [Character].[Dexterity](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Dexterity/@score)[1]', 'varchar(max)')
END;