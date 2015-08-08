CREATE TABLE [Reference].[References] (
    [Data]     XML([Reference].[RulesElement]) NOT NULL,
    [Name]     AS  ([Reference].[Name]([Data])) PERSISTED NOT NULL,
    [Type]     AS  ([Reference].[Type]([Data])) PERSISTED NOT NULL,
    [Id]       AS  ([Reference].[InternalId]([Data])) PERSISTED NOT NULL,
    [Source]   AS  ([Reference].[Source]([Data])),
    [Revision] AS  ([Reference].[Revision]([Data])),
    CONSTRAINT [PK_Reference_ID] PRIMARY KEY CLUSTERED ([Id] ASC),
	INDEX [IX_Reference_Type] NONCLUSTERED ([Type] ASC),
	INDEX [IX_Reference_Name] NONCLUSTERED ([Name] ASC)
);

