


CREATE VIEW [dbo].[Rules] WITH SCHEMABINDING AS SELECT
[Name],
[Id],
Rules.value('local-name(.)', 'VARCHAR(MAX)') [local-name],
Rules.value('(@name)[1]', 'VARCHAR(MAX)') [rule-name],
Rules.value('(@value)[1]', 'VARCHAR(MAX)') [value],
Rules.value('(@type)[1]', 'VARCHAR(MAX)') [type],
Rules.value('(@number)[1]', 'VARCHAR(MAX)') [number],
Rules.value('(@optional)[1]', 'VARCHAR(MAX)') [optional],
Rules.value('(@die-increase)[1]', 'VARCHAR(MAX)') [die-increase],
Rules.value('(@multiclass)[1]', 'VARCHAR(MAX)') [multiclass],
Rules.value('(@zero)[1]', 'VARCHAR(MAX)') [zero],
Rules.value('(@statmin)[1]', 'VARCHAR(MAX)') [statmin],
Rules.value('(@power-replace)[1]', 'VARCHAR(MAX)') [power-replace],
Rules.value('(@retrain)[1]', 'VARCHAR(MAX)') [retrain],
Rules.value('(@list-addition)[1]', 'VARCHAR(MAX)') [list-addition],
Rules.value('(@default)[1]', 'VARCHAR(MAX)') [default],
Rules.value('(@grant)[1]', 'VARCHAR(MAX)') [grant],
Rules.value('(@non-zero)[1]', 'VARCHAR(MAX)') [non-zero],
Rules.value('(@requires)[1]', 'VARCHAR(MAX)') [requires],
Rules.value('(@Prepare)[1]', 'VARCHAR(MAX)') [Prepare],
Rules.value('(@powerswap)[1]', 'VARCHAR(MAX)') [powerswap],
Rules.value('(@field)[1]', 'VARCHAR(MAX)') [field],
Rules.value('(@spellbook)[1]', 'VARCHAR(MAX)') [spellbook],
Rules.value('(@not-wearing)[1]', 'VARCHAR(MAX)') [not-wearing],
Rules.value('(@Category)[1]', 'VARCHAR(MAX)') [Category],
Rules.value('(@wearing)[1]', 'VARCHAR(MAX)') [wearing],
Rules.value('(@existing)[1]', 'VARCHAR(MAX)') [existing],
Rules.value('(@condition)[1]', 'VARCHAR(MAX)') [condition],
Rules.value('(@half-point)[1]', 'VARCHAR(MAX)') [half-point],
Rules.value('(@select)[1]', 'VARCHAR(MAX)') [select],
Rules.value('(@Level)[1]', 'VARCHAR(MAX)') [Level],
Rules.value('(@alias)[1]', 'VARCHAR(MAX)') [alias]
FROM dbo.Reference CROSS APPLY
	Data.nodes('/*/rules/*') AS Data(Rules)



