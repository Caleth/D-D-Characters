CREATE FUNCTION dbo.Character_Dexterity(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Dexterity/@score)[1]', 'varchar(max)')
END;