

CREATE VIEW [Reference].[Skills] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/specific[@name="Key Ability"])[1]', 'VARCHAR(MAX)') [Key Ability],
Data
FROM [Reference].[References]
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Skill'



