

CREATE VIEW [Reference].[Races] WITH SCHEMABINDING AS SELECT
[Name],
[Type],
[Id],
[Source],
[Revision],
Data.value('(/*/Flavor)[1]', 'VARCHAR(MAX)') [Flavor],
Data.value('(/*/Prereqs)[1]', 'VARCHAR(MAX)') [Prereqs],
Data.query('(/*/rules)') [rules],
Data.value('(/*/specific[@name="Ability Scores"])[1]', 'VARCHAR(MAX)') [Ability Scores],
Data.value('(/*/specific[@name="Attitudes and Beliefs"])[1]', 'VARCHAR(MAX)') [Attitudes and Beliefs],
Data.value('(/*/specific[@name="Average Height"])[1]', 'VARCHAR(MAX)') [Average Height],
Data.value('(/*/specific[@name="Average Weight"])[1]', 'VARCHAR(MAX)') [Average Weight],
Data.value('(/*/specific[@name="Bladeling Names"])[1]', 'VARCHAR(MAX)') [Bladeling Names],
Data.value('(/*/specific[@name="Bladeling Surnames"])[1]', 'VARCHAR(MAX)') [Bladeling Surnames],
Data.value('(/*/specific[@name="Characteristics"])[1]', 'VARCHAR(MAX)') [Characteristics],
Data.value('(/*/specific[@name="Clan Names"])[1]', 'VARCHAR(MAX)') [Clan Names],
Data.value('(/*/specific[@name="Female Names"])[1]', 'VARCHAR(MAX)') [Female Names],
Data.value('(/*/specific[@name="Languages"])[1]', 'VARCHAR(MAX)') [Languages],
Data.value('(/*/specific[@name="Male Names"])[1]', 'VARCHAR(MAX)') [Male Names],
Data.value('(/*/specific[@name="Names"])[1]', 'VARCHAR(MAX)') [Names],
Data.value('(/*/specific[@name="Physical Qualities"])[1]', 'VARCHAR(MAX)') [Physical Qualities],
Data.value('(/*/specific[@name="Playing"])[1]', 'VARCHAR(MAX)') [Playing],
Data.value('(/*/specific[@name="Racial Traits"])[1]', 'VARCHAR(MAX)') [Racial Traits],
Data.value('(/*/specific[@name="Short Description"])[1]', 'VARCHAR(MAX)') [Short Description],
Data.value('(/*/specific[@name="Size"])[1]', 'VARCHAR(MAX)') [Size],
Data.value('(/*/specific[@name="Skill Bonuses"])[1]', 'VARCHAR(MAX)') [Skill Bonuses],
Data.value('(/*/specific[@name="Speed"])[1]', 'VARCHAR(MAX)') [Speed],
Data.value('(/*/specific[@name="Tinker Gnome Communities"])[1]', 'VARCHAR(MAX)') [Tinker Gnome Communities],
Data.value('(/*/specific[@name="Tinker Gnomre Adventurers"])[1]', 'VARCHAR(MAX)') [Tinker Gnomre Adventurers],
Data.value('(/*/specific[@name="Tribal Names"])[1]', 'VARCHAR(MAX)') [Tribal Names],
Data.value('(/*/specific[@name="Vision"])[1]', 'VARCHAR(MAX)') [Vision],
Data
FROM [Reference].[References]
WHERE Data.value('(/*/@type)[1]', 'VARCHAR(MAX)') = 'Race'



