CREATE TABLE [dbo].[Providers] (
    [ID]             UNIQUEIDENTIFIER CONSTRAINT [DF_Providers_ID] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (200)   NOT NULL,
    [PointOfContact] NVARCHAR (150)   NOT NULL,
    [Address]        NVARCHAR (150)   NOT NULL,
    [CUIT]           NVARCHAR (50)    NOT NULL,
    [CityID]         UNIQUEIDENTIFIER NOT NULL,
    [ProvinceID]     INT              NOT NULL,
    [CreateDate]     DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Providers_Cities] FOREIGN KEY ([CityID]) REFERENCES [dbo].[Cities] ([ID]),
    CONSTRAINT [FK_Providers_Provinces] FOREIGN KEY ([ProvinceID]) REFERENCES [dbo].[Provinces] ([ID])
);

