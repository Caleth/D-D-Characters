CREATE TABLE [dbo].[Reference] (
    [Data]     XML NOT NULL,
    [Name]     AS  ([dbo].[Reference_Name]([Data])) PERSISTED NOT NULL,
    [Type]     AS  ([dbo].[Reference_Type]([Data])) PERSISTED NOT NULL,
    [ID]       AS  ([dbo].[Reference_Id]([Data])) PERSISTED NOT NULL,
    [Source]   AS  ([dbo].[Reference_Source]([Data])),
    [Revision] AS  ([dbo].[Reference_Revision]([Data])),
    CONSTRAINT [PK_Reference_ID] PRIMARY KEY CLUSTERED ([ID] ASC),
	INDEX [IX_Reference_Type] NONCLUSTERED ([Type] ASC),
	INDEX [IX_Reference_Name] NONCLUSTERED ([Name] ASC)
);

