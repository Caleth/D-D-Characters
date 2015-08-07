

CREATE VIEW [dbo].[Powers] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Category)[1]', 'VARCHAR(MAX)') [Category],
Data.value('(/*/Flavor)[1]', 'VARCHAR(MAX)') [Flavor],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.value('(/*/print-prereqs)[1]', 'VARCHAR(MAX)') [print-prereqs],
Data
FROM dbo.Reference
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Power'



