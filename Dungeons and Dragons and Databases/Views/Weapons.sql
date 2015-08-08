

CREATE VIEW [Reference].[Weapons] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Category)[1]', 'VARCHAR(MAX)') [Category],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.query('(/*/rules)') [rules],
Data.value('(/*/specific[@name="_AlternateSlot"])[1]', 'VARCHAR(MAX)') [_AlternateSlot],
Data.value('(/*/specific[@name="_IncludeImprovised"])[1]', 'VARCHAR(MAX)') [_IncludeImprovised],
Data.value('(/*/specific[@name="_Primary End"])[1]', 'VARCHAR(MAX)') [_Primary End],
Data.value('(/*/specific[@name="_Secondary End"])[1]', 'VARCHAR(MAX)') [_Secondary End],
Data.value('(/*/specific[@name="_SupportsID"])[1]', 'VARCHAR(MAX)') [_SupportsID],
Data.value('(/*/specific[@name="_Tags"])[1]', 'VARCHAR(MAX)') [_Tags],
Data.value('(/*/specific[@name="Additional Slot"])[1]', 'VARCHAR(MAX)') [Additional Slot],
Data.value('(/*/specific[@name="Armor Category"])[1]', 'VARCHAR(MAX)') [Armor Category],
Data.value('(/*/specific[@name="Armor Type"])[1]', 'VARCHAR(MAX)') [Armor Type],
Data.value('(/*/specific[@name="Critical"])[1]', 'VARCHAR(MAX)') [Critical],
Data.value('(/*/specific[@name="Damage"])[1]', 'VARCHAR(MAX)') [Damage],
Data.value('(/*/specific[@name="Enhancement"])[1]', 'VARCHAR(MAX)') [Enhancement],
Data.value('(/*/specific[@name="Full Text"])[1]', 'VARCHAR(MAX)') [Full Text],
Data.value('(/*/specific[@name="Gold"])[1]', 'VARCHAR(MAX)') [Gold],
Data.value('(/*/specific[@name="Group"])[1]', 'VARCHAR(MAX)') [Group],
Data.value('(/*/specific[@name="Hands Required"])[1]', 'VARCHAR(MAX)') [Hands Required],
Data.value('(/*/specific[@name="InternalOnly"])[1]', 'VARCHAR(MAX)') [InternalOnly],
Data.value('(/*/specific[@name="Item Slot"])[1]', 'VARCHAR(MAX)') [Item Slot],
Data.value('(/*/specific[@name="Proficiency Bonus"])[1]', 'VARCHAR(MAX)') [Proficiency Bonus],
Data.value('(/*/specific[@name="Properties"])[1]', 'VARCHAR(MAX)') [Properties],
Data.value('(/*/specific[@name="Range"])[1]', 'VARCHAR(MAX)') [Range],
Data.value('(/*/specific[@name="Silver"])[1]', 'VARCHAR(MAX)') [Silver],
Data.value('(/*/specific[@name="Size"])[1]', 'VARCHAR(MAX)') [Size],
Data.value('(/*/specific[@name="Weapon Category"])[1]', 'VARCHAR(MAX)') [Weapon Category],
Data.value('(/*/specific[@name="Weight"])[1]', 'VARCHAR(MAX)') [Weight],
Data
FROM [Reference].[References]
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Weapon'



