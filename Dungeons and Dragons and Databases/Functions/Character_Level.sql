﻿CREATE FUNCTION dbo.Character_Level(@xml xml) RETURNS varchar(200)
AS
BEGIN
 RETURN @xml.value('(//Details/Level/text())[1]', 'varchar(max)')
END;