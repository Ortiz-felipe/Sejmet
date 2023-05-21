CREATE TABLE [dbo].[TherapeuticEffects] (
    [ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_TherapeuticEffects] PRIMARY KEY CLUSTERED ([ID] ASC)
);

