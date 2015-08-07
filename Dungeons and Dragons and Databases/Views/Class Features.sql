

CREATE VIEW [dbo].[Class Features] WITH SCHEMABINDING AS SELECT
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
Data.value('(/*/specific[@name="_CLASSNAME"])[1]', 'VARCHAR(MAX)') [_CLASSNAME],
Data.value('(/*/specific[@name="_CS_ShortDescription"])[1]', 'VARCHAR(MAX)') [_CS_ShortDescription],
Data.value('(/*/specific[@name="_DisplayAssociates"])[1]', 'VARCHAR(MAX)') [_DisplayAssociates],
Data.value('(/*/specific[@name="_DisplayName"])[1]', 'VARCHAR(MAX)') [_DisplayName],
Data.value('(/*/specific[@name="_DisplayPowers"])[1]', 'VARCHAR(MAX)') [_DisplayPowers],
Data.value('(/*/specific[@name="_DisplayWeapons"])[1]', 'VARCHAR(MAX)') [_DisplayWeapons],
Data.value('(/*/specific[@name="_ImplementForPower"])[1]', 'VARCHAR(MAX)') [_ImplementForPower],
Data.value('(/*/specific[@name="_PARSED_CHILD_FEATURES"])[1]', 'VARCHAR(MAX)') [_PARSED_CHILD_FEATURES],
Data.value('(/*/specific[@name="_PARSED_CLASS_FEATURE"])[1]', 'VARCHAR(MAX)') [_PARSED_CLASS_FEATURE],
Data.value('(/*/specific[@name="_PARSED_SUB_FEATURES"])[1]', 'VARCHAR(MAX)') [_PARSED_SUB_FEATURES],
Data.value('(/*/specific[@name="_RequiresID"])[1]', 'VARCHAR(MAX)') [_RequiresID],
Data.value('(/*/specific[@name="_SupportsID"])[1]', 'VARCHAR(MAX)') [_SupportsID],
Data.value('(/*/specific[@name="_Tags"])[1]', 'VARCHAR(MAX)') [_Tags],
Data.value('(/*/specific[@name="Class"])[1]', 'VARCHAR(MAX)') [Class],
Data.value('(/*/specific[@name="Damage Stat"])[1]', 'VARCHAR(MAX)') [Damage Stat],
Data.value('(/*/specific[@name="HALF-CON"])[1]', 'VARCHAR(MAX)') [HALF-CON],
Data.value('(/*/specific[@name="Level"])[1]', 'VARCHAR(MAX)') [Level],
Data.value('(/*/specific[@name="Pact Reward"])[1]', 'VARCHAR(MAX)') [Pact Reward],
Data.value('(/*/specific[@name="Pet Hit Points"])[1]', 'VARCHAR(MAX)') [Pet Hit Points],
Data.value('(/*/specific[@name="Pet Toughness"])[1]', 'VARCHAR(MAX)') [Pet Toughness],
Data.value('(/*/specific[@name="Powers"])[1]', 'VARCHAR(MAX)') [Powers],
Data.value('(/*/specific[@name="Short Description"])[1]', 'VARCHAR(MAX)') [Short Description],
Data.value('(/*/specific[@name="Tier"])[1]', 'VARCHAR(MAX)') [Tier],
Data.value('(/*/specific[@name="type"])[1]', 'VARCHAR(MAX)') [specific type],
Data.value('(/*/specific[@name="Usage"])[1]', 'VARCHAR(MAX)') [Usage],
Data.value('(/*/specific[@name="Weapon"])[1]', 'VARCHAR(MAX)') [Weapon],
Data
FROM dbo.Reference
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Class Feature'



