CREATE TABLE [dbo].[Provinces] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED ([ID] ASC)
);

