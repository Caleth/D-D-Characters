﻿CREATE TABLE [Character].[Characters] (
    [Blob]           XML([Character].[CharacterSheet]) NOT NULL,
    [Modified]       DATETIME       NOT NULL,
    [Name]           NVARCHAR (50)  NOT NULL,
    [Age]            AS             ([Character].[Age]([Blob])),
    [Alignment]      AS             ([Character].[Alignment]([Blob])),
    [Appearance]     AS             ([Character].[Appearance]([Blob])),
    [CarriedMoney]   AS             ([Character].[CarriedMoney]([Blob])),
    [Charisma]       AS             ([Character].[Charisma]([Blob])),
    [Companions]     AS             ([Character].[Companions]([Blob])),
    [Company]        AS             ([Character].[Company]([Blob])),
    [Constitution]   AS             ([Character].[Constitution]([Blob])),
    [Dexterity]      AS             ([Character].[Dexterity]([Blob])),
    [Experience]     AS             ([Character].[Experience]([Blob])),
    [Gender]         AS             ([Character].[Gender]([Blob])),
    [Height]         AS             ([Character].[Height]([Blob])),
    [Intelligence]   AS             ([Character].[Intelligence]([Blob])),
    [Level]          AS             ([Character].[Level]([Blob])),
    [Character-Name] AS             ([Character].[Name]([Blob])),
    [Notes]          AS             ([Character].[Notes]([Blob])),
    [Player]         AS             ([Character].[Player]([Blob])),
    [Portrait]       AS             ([Character].[Portrait]([Blob])),
    [StoredMoney]    AS             ([Character].[StoredMoney]([Blob])),
    [Strength]       AS             ([Character].[Strength]([Blob])),
    [Traits]         AS             ([Character].[Traits]([Blob])),
    [Weight]         AS             ([Character].[Weight]([Blob])),
    [Wisdom]         AS             ([Character].[Wisdom]([Blob])),
    CONSTRAINT [PK_Characters_NameModified] PRIMARY KEY CLUSTERED ([Name] ASC, [Modified] ASC) WITH (IGNORE_DUP_KEY = ON)
);
GO

CREATE PRIMARY XML INDEX [XML_IX_Characters_Blob]
    ON [Character].[Characters]([Blob])
    WITH (PAD_INDEX = OFF);
GO