CREATE FUNCTION dbo.Character_Strength(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Strength/@score)[1]', 'varchar(max)')
END;