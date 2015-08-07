

CREATE VIEW [dbo].[Classes] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Flavor)[1]', 'VARCHAR(MAX)') [Flavor],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.value('(/*/rules)[1]', 'VARCHAR(MAX)') [rules],
Data.value('(/*/specific[@name="_DisplayName"])[1]', 'VARCHAR(MAX)') [_DisplayName],
Data.value('(/*/specific[@name="_ParentClass"])[1]', 'VARCHAR(MAX)') [_ParentClass],
Data.value('(/*/specific[@name="_PARSED_CLASS_FEATURE"])[1]', 'VARCHAR(MAX)') [_PARSED_CLASS_FEATURE],
Data.value('(/*/specific[@name="_PowerSourceElement"])[1]', 'VARCHAR(MAX)') [_PowerSourceElement],
Data.value('(/*/specific[@name="_RoleElement"])[1]', 'VARCHAR(MAX)') [_RoleElement],
Data.value('(/*/specific[@name="_SecondaryPowerSourceElement"])[1]', 'VARCHAR(MAX)') [_SecondaryPowerSourceElement],
Data.value('(/*/specific[@name="_SUGGESTED_FEATS"])[1]', 'VARCHAR(MAX)') [_SUGGESTED_FEATS],
Data.value('(/*/specific[@name="_SUGGESTED_FEATURES"])[1]', 'VARCHAR(MAX)') [_SUGGESTED_FEATURES],
Data.value('(/*/specific[@name="Armor Proficiencies"])[1]', 'VARCHAR(MAX)') [Armor Proficiencies],
Data.value('(/*/specific[@name="Bonus to Defense"])[1]', 'VARCHAR(MAX)') [Bonus to Defense],
Data.value('(/*/specific[@name="Build Options"])[1]', 'VARCHAR(MAX)') [Build Options],
Data.value('(/*/specific[@name="Class Features"])[1]', 'VARCHAR(MAX)') [Class Features],
Data.value('(/*/specific[@name="Class Skills"])[1]', 'VARCHAR(MAX)') [Class Skills],
Data.value('(/*/specific[@name="Creating"])[1]', 'VARCHAR(MAX)') [Creating],
Data.value('(/*/specific[@name="Healing Surges"])[1]', 'VARCHAR(MAX)') [Healing Surges],
Data.value('(/*/specific[@name="Hit Points at 1st Level"])[1]', 'VARCHAR(MAX)') [Hit Points at 1st Level],
Data.value('(/*/specific[@name="Hit Points per Level Gained"])[1]', 'VARCHAR(MAX)') [Hit Points per Level Gained],
Data.value('(/*/specific[@name="Hybrid Talent Options"])[1]', 'VARCHAR(MAX)') [Hybrid Talent Options],
Data.value('(/*/specific[@name="Implement"])[1]', 'VARCHAR(MAX)') [Implement],
Data.value('(/*/specific[@name="Implements"])[1]', 'VARCHAR(MAX)') [Implements],
Data.value('(/*/specific[@name="Key Abilities"])[1]', 'VARCHAR(MAX)') [Key Abilities],
Data.value('(/*/specific[@name="Power Name"])[1]', 'VARCHAR(MAX)') [Power Name],
Data.value('(/*/specific[@name="Power Source"])[1]', 'VARCHAR(MAX)') [Power Source],
Data.value('(/*/specific[@name="Powers"])[1]', 'VARCHAR(MAX)') [Powers],
Data.value('(/*/specific[@name="Role"])[1]', 'VARCHAR(MAX)') [Role],
Data.value('(/*/specific[@name="Secondary Abilities"])[1]', 'VARCHAR(MAX)') [Secondary Abilities],
Data.value('(/*/specific[@name="Short Description"])[1]', 'VARCHAR(MAX)') [Short Description],
Data.value('(/*/specific[@name="Skald Powers"])[1]', 'VARCHAR(MAX)') [Skald Powers],
Data.value('(/*/specific[@name="Supplemental"])[1]', 'VARCHAR(MAX)') [Supplemental],
Data.value('(/*/specific[@name="Trained Skills"])[1]', 'VARCHAR(MAX)') [Trained Skills],
Data.value('(/*/specific[@name="Trait Package"])[1]', 'VARCHAR(MAX)') [Trait Package],
Data.value('(/*/specific[@name="Weapon Proficiencies"])[1]', 'VARCHAR(MAX)') [Weapon Proficiencies],
Data
FROM dbo.Reference
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Class'



