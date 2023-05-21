CREATE TABLE [dbo].[ActiveCompounds] (
    [ID]                  UNIQUEIDENTIFIER CONSTRAINT [DF_ActiveCompounds_ID] DEFAULT (newid()) NOT NULL,
    [Name]                NVARCHAR (200)   NOT NULL,
    [MaxDosage]           INT              NOT NULL,
    [TherapeuticEffectID] INT              NOT NULL,
    CONSTRAINT [PK_ActiveCompounds] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ActiveCompounds_TherapeuticEffects] FOREIGN KEY ([TherapeuticEffectID]) REFERENCES [dbo].[TherapeuticEffects] ([ID])
);

