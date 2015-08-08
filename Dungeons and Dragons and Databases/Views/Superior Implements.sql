

CREATE VIEW [Reference].[Superior Implements] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/rules)[1]', 'VARCHAR(MAX)') [rules],
Data.value('(/*/specific[@name="_DamageType"])[1]', 'VARCHAR(MAX)') [_DamageType],
Data.value('(/*/specific[@name="Full Text"])[1]', 'VARCHAR(MAX)') [Full Text],
Data.value('(/*/specific[@name="Gold"])[1]', 'VARCHAR(MAX)') [Gold],
Data.value('(/*/specific[@name="Group"])[1]', 'VARCHAR(MAX)') [Group],
Data.value('(/*/specific[@name="Item Slot"])[1]', 'VARCHAR(MAX)') [Item Slot],
Data.value('(/*/specific[@name="Properties"])[1]', 'VARCHAR(MAX)') [Properties],
Data.value('(/*/specific[@name="WeaponEquiv"])[1]', 'VARCHAR(MAX)') [WeaponEquiv],
Data.value('(/*/specific[@name="Weight"])[1]', 'VARCHAR(MAX)') [Weight],

Data
FROM [Reference].[References]
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Superior Implement'



