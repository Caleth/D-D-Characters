CREATE FUNCTION GetSpecifics 
(	
	@Id VARCHAR(50)
)
RETURNS TABLE 
WITH SCHEMABINDING
AS
RETURN 
(
	SELECT Child.query('.') specifics FROM dbo.Reference
	CROSS APPLY [Data].nodes('/RulesElement[internal-id = sql:variable("@Id")]/*') AS XMLItem(Child)
)