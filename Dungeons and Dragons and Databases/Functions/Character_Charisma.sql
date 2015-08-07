﻿CREATE FUNCTION dbo.Character_Charisma(@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//AbilityScores/Charisma/@score)[1]', 'varchar(max)')
END;