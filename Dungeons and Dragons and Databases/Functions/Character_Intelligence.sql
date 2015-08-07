CREATE FUNCTION dbo.Character_Intelligence(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Intelligence/@score)[1]', 'varchar(max)')
END;