﻿

CREATE VIEW [Reference].[MagicItems] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Category)[1]', 'VARCHAR(MAX)') [Category],
Data.value('(/*/Flavor)[1]', 'VARCHAR(MAX)') [Flavor],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.query('(/*/rules)') [rules],
Data.value('(/*/specific[@name="_AlternateSlot"])[1]', 'VARCHAR(MAX)') [_AlternateSlot],
Data.value('(/*/specific[@name="_AlwaysExecute"])[1]', 'VARCHAR(MAX)') [_AlwaysExecute],
Data.value('(/*/specific[@name="_AssociatedMonsters"])[1]', 'VARCHAR(MAX)') [_AssociatedMonsters],
Data.value('(/*/specific[@name="_Bonus"])[1]', 'VARCHAR(MAX)') [_Bonus],
Data.value('(/*/specific[@name="_CannotBeBought"])[1]', 'VARCHAR(MAX)') [_CannotBeBought],
Data.value('(/*/specific[@name="_DisplayPowers"])[1]', 'VARCHAR(MAX)') [_DisplayPowers],
Data.value('(/*/specific[@name="_Enhancement"])[1]', 'VARCHAR(MAX)') [_Enhancement],
Data.value('(/*/specific[@name="_ImplementEquiv"])[1]', 'VARCHAR(MAX)') [_ImplementEquiv],
Data.value('(/*/specific[@name="_ImplementForClass"])[1]', 'VARCHAR(MAX)') [_ImplementForClass],
Data.value('(/*/specific[@name="_ImplementForPower"])[1]', 'VARCHAR(MAX)') [_ImplementForPower],
Data.value('(/*/specific[@name="_IsEnchant"])[1]', 'VARCHAR(MAX)') [_IsEnchant],
Data.value('(/*/specific[@name="_Item_Set_ID"])[1]', 'VARCHAR(MAX)') [_Item_Set_ID],
Data.value('(/*/specific[@name="_Monster"])[1]', 'VARCHAR(MAX)') [_Monster],
Data.value('(/*/specific[@name="_Rarity"])[1]', 'VARCHAR(MAX)') [_Rarity],
Data.value('(/*/specific[@name="_SupportsID"])[1]', 'VARCHAR(MAX)') [_SupportsID],
Data.value('(/*/specific[@name="_Tags"])[1]', 'VARCHAR(MAX)') [_Tags],
Data.value('(/*/specific[@name="_UniversalImplement"])[1]', 'VARCHAR(MAX)') [_UniversalImplement],
Data.value('(/*/specific[@name="Alternative Reward"])[1]', 'VARCHAR(MAX)') [Alternative Reward],
Data.value('(/*/specific[@name="Armor"])[1]', 'VARCHAR(MAX)') [Armor],
Data.value('(/*/specific[@name="Attack Power"])[1]', 'VARCHAR(MAX)') [Attack Power],
Data.value('(/*/specific[@name="Component"])[1]', 'VARCHAR(MAX)') [Component],
Data.value('(/*/specific[@name="Critical"])[1]', 'VARCHAR(MAX)') [Critical],
Data.value('(/*/specific[@name="EnchantEquiv"])[1]', 'VARCHAR(MAX)') [EnchantEquiv],
Data.value('(/*/specific[@name="Enhancement"])[1]', 'VARCHAR(MAX)') [Enhancement],
Data.value('(/*/specific[@name="Formula Cost"])[1]', 'VARCHAR(MAX)') [Formula Cost],
Data.value('(/*/specific[@name="Gold"])[1]', 'VARCHAR(MAX)') [Gold],
Data.value('(/*/specific[@name="Granted Powers"])[1]', 'VARCHAR(MAX)') [Granted Powers],
Data.value('(/*/specific[@name="Implement"])[1]', 'VARCHAR(MAX)') [Implement],
Data.value('(/*/specific[@name="Item Slot"])[1]', 'VARCHAR(MAX)') [Item Slot],
Data.value('(/*/specific[@name="Key Ability"])[1]', 'VARCHAR(MAX)') [Key Ability],
Data.value('(/*/specific[@name="Key Skill"])[1]', 'VARCHAR(MAX)') [Key Skill],
Data.value('(/*/specific[@name="Level"])[1]', 'VARCHAR(MAX)') [Level],
Data.value('(/*/specific[@name="Magic Item Type"])[1]', 'VARCHAR(MAX)') [Magic Item Type],
Data.value('(/*/specific[@name="Offhand Implement Bonus"])[1]', 'VARCHAR(MAX)') [Offhand Implement Bonus],
Data.value('(/*/specific[@name="Power"])[1]', 'VARCHAR(MAX)') [Power],
Data.value('(/*/specific[@name="Prerequisite"])[1]', 'VARCHAR(MAX)') [Prerequisite],
Data.value('(/*/specific[@name="Proficient As"])[1]', 'VARCHAR(MAX)') [Proficient As],
Data.value('(/*/specific[@name="Properties"])[1]', 'VARCHAR(MAX)') [Properties],
Data.value('(/*/specific[@name="Property"])[1]', 'VARCHAR(MAX)') [Property],
Data.value('(/*/specific[@name="Range"])[1]', 'VARCHAR(MAX)') [Range],
Data.value('(/*/specific[@name="Rarity"])[1]', 'VARCHAR(MAX)') [Rarity],
Data.value('(/*/specific[@name="Requirement"])[1]', 'VARCHAR(MAX)') [Requirement],
Data.value('(/*/specific[@name="Special"])[1]', 'VARCHAR(MAX)') [Special],
Data.value('(/*/specific[@name="Tier"])[1]', 'VARCHAR(MAX)') [Tier],
Data.value('(/*/specific[@name="Time"])[1]', 'VARCHAR(MAX)') [Time],
Data.value('(/*/specific[@name="Weapon"])[1]', 'VARCHAR(MAX)') [Weapon],
Data.value('(/*/specific[@name="WeaponEquiv"])[1]', 'VARCHAR(MAX)') [WeaponEquiv],
Data.value('(/*/specific[@name="Weight"])[1]', 'VARCHAR(MAX)') [Weight],
Data
FROM [Reference].[References]
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Magic Item'



