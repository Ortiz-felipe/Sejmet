CREATE TABLE [dbo].[Customers] (
    [ID]                  UNIQUEIDENTIFIER CONSTRAINT [DF_Customers_ID] DEFAULT (newid()) NOT NULL,
    [FirstName]           NVARCHAR (100)   NOT NULL,
    [LastName]            NVARCHAR (100)   NOT NULL,
    [DNI]                 NVARCHAR (50)    NOT NULL,
    [Birthdate]           DATETIME2 (7)    NOT NULL,
    [Age]                 INT              NOT NULL,
    [HealtcareProviderID] UNIQUEIDENTIFIER NOT NULL,
    [PhoneNumber]         NVARCHAR (50)    NOT NULL,
    [Address]             NVARCHAR (50)    NOT NULL,
    [CityID]              UNIQUEIDENTIFIER NOT NULL,
    [ProvinceID]          INT              NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Customers_Cities] FOREIGN KEY ([CityID]) REFERENCES [dbo].[Cities] ([ID]),
    CONSTRAINT [FK_Customers_HealthcareProviders] FOREIGN KEY ([HealtcareProviderID]) REFERENCES [dbo].[HealthcareProviders] ([ID]),
    CONSTRAINT [FK_Customers_Provinces] FOREIGN KEY ([ProvinceID]) REFERENCES [dbo].[Provinces] ([ID])
);

