﻿CREATE FUNCTION [Character].[StoredMoney](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/StoredMoney/text())[1]', 'varchar(max)')
END;