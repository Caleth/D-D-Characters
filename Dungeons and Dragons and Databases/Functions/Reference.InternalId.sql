﻿
CREATE FUNCTION [Reference].[InternalId](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@internal-id)[1]', 'varchar(max)')
END;