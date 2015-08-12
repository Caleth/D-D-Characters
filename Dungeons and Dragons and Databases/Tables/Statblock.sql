CREATE TABLE [Character].[Statblock]
(
    [StatName]           NVARCHAR (80)						NOT NULL,
    [Modified]			 DATETIME							NOT NULL,
    [CharName]           NVARCHAR (50)						NOT NULL,
	[Value]				 NVARCHAR (20)						NOT NULL,
	[Breakdown]			 XML([Character].[CharacterSheet])	NOT NULL,
	CONSTRAINT [FK_Character] FOREIGN KEY ([CharName], [Modified]) REFERENCES [Character].[Characters] ([Name], [Modified]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [PK_Statblock_NameModified] PRIMARY KEY CLUSTERED ([CharName] ASC, [StatName]ASC, [Modified] ASC) WITH (IGNORE_DUP_KEY = ON)
)
