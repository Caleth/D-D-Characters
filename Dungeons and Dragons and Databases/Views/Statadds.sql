CREATE VIEW [Character].[Statadds]
WITH SCHEMABINDING
AS WITH [Elements] AS (
	SELECT 
		[Name], 
		[Modified],
		Elements.value('./@name', 'VARCHAR(MAX)') AS [Element-Name], 
		Elements.value('./@charelem', 'VARCHAR(8)') AS [charelem] 
	FROM [Character].Characters
	CROSS APPLY Blob.nodes('/D20Character/CharacterSheet/RulesElementTally/RulesElement, /D20Character/CharacterSheet/LootTally/loot/RulesElement') AS Blob(Elements) 
)
SELECT 
	[Stats].[CharName], 
	[Stats].[StatName], 
	[Stats].[Value],
	CASE 
		WHEN statadd.exist('./@abilmod') = 1
			THEN CAST( FLOOR( ( PARSE( [lookup].Breakdown.value('*[1]/@value', 'VARCHAR(MAX)') AS FLOAT ) - 10.0 ) / 2.0 ) AS VARCHAR(MAX) )
		WHEN statadd.exist('./@statlink') = 1
			THEN [lookup].Breakdown.value('*[1]/@value', 'VARCHAR(MAX)')
		WHEN statadd.exist('./@String') = 1
			THEN COALESCE( [References].[Name], statadd.value('./@String', 'VARCHAR(200)') )
		ELSE statadd.value('./@value', 'VARCHAR(MAX)')
	END AS [Stuff Value],
	CASE 
		WHEN statadd.exist('./@type') = 1
			THEN statadd.value('./@type', 'VARCHAR(MAX)') 
		ELSE 'Untyped ' + CAST( ROW_NUMBER() OVER (
			PARTITION BY [Stats].[CharName], [Stats].[Modified], [Stats].[StatName] 
			ORDER BY ( SELECT NULL )
		) AS VARCHAR(10) )
	END AS [Type],
	CASE
		WHEN statadd.exist('./@charelem') = 1 
			THEN [Element-Name] 
		ELSE 'Unknown'
	END AS [Source],
	statadd.value('./@Level', 'INT') AS Level,
	statadd.query('data(@wearing), data(@requires[substring(., 1, 1) != ''!''])') AS Requires,
	statadd.query('data(@not-wearing), data(substring(@requires[substring(., 1, 1) = ''!''], 2))') AS Rejects,
	statadd.query('data(@conditional)') AS Conditional
FROM [Character].[Statblock] [Stats]
CROSS APPLY Breakdown.nodes('/Stat/statadd') AS Breakdown(statadd)
LEFT JOIN [Character].[Statblock] [lookup] 
	ON [lookup].[CharName] = [Stats].[CharName] 
	AND [lookup].[Modified] = [Stats].[Modified]
	AND [lookup].[StatName] = statadd.value('./@statlink', 'VARCHAR(MAX)')
LEFT JOIN [Elements] [elem]
	ON [elem].[Name] = [Stats].[CharName] 
	AND [elem].[Modified] = [Stats].[Modified]
	AND [elem].[charelem] = statadd.value('./@charelem', 'VARCHAR(8)') 
LEFT JOIN [Reference].[References]
	ON [Id] = statadd.value('./@String', 'VARCHAR(200)')
