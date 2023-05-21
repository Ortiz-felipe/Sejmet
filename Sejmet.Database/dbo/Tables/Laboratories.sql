CREATE TABLE [dbo].[Laboratories] (
    [ID]   UNIQUEIDENTIFIER CONSTRAINT [DF_Laboratories_ID] DEFAULT (newid()) NOT NULL,
    [Name] NVARCHAR (100)   NOT NULL,
    CONSTRAINT [PK_Laboratories] PRIMARY KEY CLUSTERED ([ID] ASC)
);

