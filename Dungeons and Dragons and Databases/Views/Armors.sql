
CREATE VIEW [dbo].[Armors] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Category)[1]', 'VARCHAR(MAX)') [Category],
Data.value('(/*/rules)[1]', 'VARCHAR(MAX)') [rules],
Data.value('(/*/specific[@name="Armor Bonus"])[1]', 'VARCHAR(MAX)') [Armor Bonus],
Data.value('(/*/specific[@name="Armor Category"])[1]', 'VARCHAR(MAX)') [Armor Category],
Data.value('(/*/specific[@name="Armor Type"])[1]', 'VARCHAR(MAX)') [Armor Type],
Data.value('(/*/specific[@name="Check"])[1]', 'VARCHAR(MAX)') [Check],
Data.value('(/*/specific[@name="Full Text"])[1]', 'VARCHAR(MAX)') [Full Text],
Data.value('(/*/specific[@name="Gold"])[1]', 'VARCHAR(MAX)') [Gold],
Data.value('(/*/specific[@name="Item Slot"])[1]', 'VARCHAR(MAX)') [Item Slot],
Data.value('(/*/specific[@name="Minimum Enhancement Bonus"])[1]', 'VARCHAR(MAX)') [Minimum Enhancement Bonus],
Data.value('(/*/specific[@name="Special"])[1]', 'VARCHAR(MAX)') [Special],
Data.value('(/*/specific[@name="Speed"])[1]', 'VARCHAR(MAX)') [Speed],
Data.value('(/*/specific[@name="Weight"])[1]', 'VARCHAR(MAX)') [Weight],
Data
FROM dbo.Reference
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Armor'

