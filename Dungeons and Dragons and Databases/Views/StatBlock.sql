CREATE VIEW [Character].[StatBlock]
WITH SCHEMABINDING
AS
WITH [Stats] AS (
	SELECT 
		[Character-Name], 
		CAST(Elements.query('data(alias[1]/@name)') AS varchar(MAX) ) AS [Stat-Name], 
		Elements.query('.') [Breakdown]
	FROM [Character].Characters
	CROSS APPLY Blob.nodes('//StatBlock/*') AS Blob(Elements) 
), [Elements] AS (
	SELECT 
		[Character-Name], 
		Elements.query('data(@name)') AS [Element-Name], 
		Elements.value('data(@charelem)', 'VARCHAR(MAX)') AS [charelem] 
	FROM [Character].Characters
	CROSS APPLY Blob.nodes('//*[self::RulesElementTally or self::LootTally]//RulesElement') AS Blob(Elements) 
)
SELECT 
	[Character-Name], 
	[Stat-Name], 
	CASE 
		WHEN statadd.exist('data(@type)[1]') = 1
			THEN statadd.query('data(@type)') 
		WHEN statadd.value('data(@abilmod)[1]', 'VARCHAR(MAX)') = 'true'
			THEN statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)')
		WHEN statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)') != '_PER-LEVEL-HPS'
			THEN statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)')
		WHEN statadd.exist('data(@charelem)') = 1 
			THEN ( 
				SELECT [Element-Name] 
				FROM [Elements] elem 
				WHERE elem.[Character-Name] = [Character-Name] 
					AND elem.charelem = statadd.value('data(@charelem)', 'VARCHAR(MAX)') 
			)
		WHEN statadd.exist('data(@Level)') = 1 
			THEN 'Level ' + statadd.value('data(@Level)[1]', 'VARCHAR(MAX)')
		ELSE [Stat-Name]
	END AS [Source],
	CASE 
		WHEN statadd.value('data(@abilmod)[1]', 'VARCHAR(MAX)') = 'true'
			THEN ( 
				SELECT CAST( ( PARSE( s.Breakdown.value('data(*/@value)[1]', 'VARCHAR(MAX)') AS INT ) - 10 ) / 2 AS VARCHAR(MAX) )
				FROM [Stats] s 
				WHERE s.[Character-Name] = [Stats].[Character-Name] 
					AND s.[Stat-Name] = statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)')
			)
		WHEN statadd.exist('data(@statlink)[1]') = 1
			THEN ( 
				SELECT s.Breakdown.value('data(*/@value)[1]', 'VARCHAR(MAX)')
				FROM [Stats] s 
				WHERE s.[Character-Name] = [Stats].[Character-Name] 
					AND s.[Stat-Name] = statadd.value('data(@statlink)[1]', 'VARCHAR(MAX)')
			)
		ELSE statadd.query('data(@value)[1]')
	END AS [Value],
	statadd.query('data(@Level)') AS Level,
	statadd.query('data(@wearing), data(@requires[substring(., 1, 1) != ''!''])') AS Requires,
	statadd.query('data(@not-wearing), data(substring(@requires[substring(., 1, 1) = ''!''], 2))') AS Rejects  
FROM [Stats]
CROSS APPLY Breakdown.nodes('/Stat/statadd') AS Breakdown(statadd)
