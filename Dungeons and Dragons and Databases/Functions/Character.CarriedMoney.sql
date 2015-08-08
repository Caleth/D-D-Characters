CREATE FUNCTION [Character].[CarriedMoney](@xml xml) RETURNS varchar(200)
WITH SCHEMABINDING
AS
BEGIN
 RETURN @xml.value('(//Details/CarriedMoney/text())[1]', 'varchar(max)')
END;