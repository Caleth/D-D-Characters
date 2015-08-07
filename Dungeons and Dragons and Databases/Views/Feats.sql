

CREATE VIEW [dbo].[Feats] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Category)[1]', 'VARCHAR(MAX)') [Category],
Data.value('(/*/Flavor)[1]', 'VARCHAR(MAX)') [Flavor],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.value('(/*/print-prereqs)[1]', 'VARCHAR(MAX)') [print-prereqs],
Data.value('(/*/rules)[1]', 'VARCHAR(MAX)') [rules],
Data.value('(/*/specific[@name="_DisplayAssociates"])[1]', 'VARCHAR(MAX)') [_DisplayAssociates],
Data.value('(/*/specific[@name="_DisplayPowers"])[1]', 'VARCHAR(MAX)') [_DisplayPowers],
Data.value('(/*/specific[@name="_PARSED_SUB_FEATURES"])[1]', 'VARCHAR(MAX)') [_PARSED_SUB_FEATURES],
Data.value('(/*/specific[@name="_RequiresID"])[1]', 'VARCHAR(MAX)') [_RequiresID],
Data.value('(/*/specific[@name="_SupportsID"])[1]', 'VARCHAR(MAX)') [_SupportsID],
Data.value('(/*/specific[@name="Associated Power Info"])[1]', 'VARCHAR(MAX)') [Associated Power Info],
Data.value('(/*/specific[@name="Associated Powers"])[1]', 'VARCHAR(MAX)') [Associated Powers],
Data.value('(/*/specific[@name="Container"])[1]', 'VARCHAR(MAX)') [Container],
Data.value('(/*/specific[@name="Short Description"])[1]', 'VARCHAR(MAX)') [Short Description],
Data.value('(/*/specific[@name="Special"])[1]', 'VARCHAR(MAX)') [Special],
Data.value('(/*/specific[@name="Tier"])[1]', 'VARCHAR(MAX)') [Tier],
Data.value('(/*/specific[@name="type"])[1]', 'VARCHAR(MAX)') [specific type],
Data
FROM dbo.Reference
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Feat'



