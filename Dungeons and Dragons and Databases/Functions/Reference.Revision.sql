
CREATE FUNCTION [Reference].[Revision](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(/*/@revision-date)[1]', 'varchar(max)')
END;