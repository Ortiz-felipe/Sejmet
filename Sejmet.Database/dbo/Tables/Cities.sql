CREATE TABLE [dbo].[Cities] (
    [ID]         UNIQUEIDENTIFIER CONSTRAINT [DF_Cities_ID] DEFAULT (newid()) NOT NULL,
    [Name]       NVARCHAR (50)    NOT NULL,
    [PostalCode] INT              NOT NULL,
    [ProvinceID] INT              NOT NULL,
    CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Cities_Provinces] FOREIGN KEY ([ProvinceID]) REFERENCES [dbo].[Provinces] ([ID])
);

