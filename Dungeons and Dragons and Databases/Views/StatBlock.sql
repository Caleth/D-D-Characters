CREATE VIEW [Character].[StatBlock]
WITH SCHEMABINDING
AS
WITH [Stats] AS (
	SELECT 
		COALESCE([Character-Name], [Name]) AS [Character-Name], 
		[Modified],
		CAST(Elements.query('data(alias[1]/@name)') AS varchar(MAX) ) AS [Stat-Name], 
		CAST(Elements.query('data(@value)') AS varchar(MAX) ) AS [Stat-Total], 
		Elements.query('.') [Breakdown]
	FROM [Character].Characters
	CROSS APPLY Blob.nodes('//StatBlock/*') AS Blob(Elements) 
), [Elements] AS (
	SELECT 
		[Character-Name], 
		[Modified],
		Elements.query('data(@name)') AS [Element-Name], 
		Elements.value('data(@charelem)', 'VARCHAR(MAX)') AS [charelem] 
	FROM [Character].Characters
	CROSS APPLY Blob.nodes('//*[self::RulesElementTally or self::LootTally]//RulesElement') AS Blob(Elements) 
)
SELECT 
	[Stats].[Character-Name], 
	[Stats].[Stat-Name], 
	[Stats].[Stat-Total],
	CASE 
		WHEN statadd.value('data(@abilmod)[1]', 'VARCHAR(MAX)') = 'true'
			THEN CAST( FLOOR( ( PARSE( [lookup].Breakdown.value('data(*/@value)[1]', 'VARCHAR(MAX)') AS FLOAT ) - 10.0 ) / 2.0 ) AS VARCHAR(MAX) )
		WHEN statadd.exist('data(@statlink)') = 1
			THEN [lookup].Breakdown.value('data(*/@value)[1]', 'VARCHAR(MAX)')
		WHEN statadd.exist('data(@String)') = 1
			THEN COALESCE( [References].[Name], statadd.value('data(@String)', 'VARCHAR(200)') )
		ELSE statadd.query('data(@value)')
	END AS [Value],
	CASE 
		WHEN statadd.exist('data(@type)') = 1
			THEN statadd.query('data(@type)') 
		ELSE 'Untyped ' + CAST( ROW_NUMBER() OVER (
			PARTITION BY [Stats].[Character-Name], [Stats].[Modified], [Stats].[Stat-Name] 
			ORDER BY ( SELECT NULL )
		) AS VARCHAR(10) )
	END AS [Type],
	CASE
		WHEN statadd.exist('data(@charelem)') = 1 
			THEN [Element-Name] 
		ELSE 'Unknown'
	END AS [Source],
	statadd.query('data(@Level)') AS Level,
	statadd.query('data(@wearing), data(@requires[substring(., 1, 1) != ''!''])') AS Requires,
	statadd.query('data(@not-wearing), data(substring(@requires[substring(., 1, 1) = ''!''], 2))') AS Rejects,
	statadd.query('data(@conditional)') AS Conditional
FROM [Stats]
CROSS APPLY Breakdown.nodes('/Stat/statadd') AS Breakdown(statadd)
LEFT JOIN [Stats] [lookup] 
	ON [lookup].[Character-Name] = [Stats].[Character-Name] 
	AND [lookup].[Modified] = [Stats].[Modified]
	AND [lookup].[Stat-Name] = statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)')
LEFT JOIN [Elements] [elem]
	ON [elem].[Character-Name] = [Stats].[Character-Name] 
	AND [elem].[Modified] = [Stats].[Modified]
	AND [elem].[charelem] = statadd.value('data(@charelem)', 'VARCHAR(MAX)') 
LEFT JOIN [Reference].[References]
	ON [Id] = statadd.value('data(@String)', 'VARCHAR(200)')
