CREATE TABLE [dbo].[HealthcareProviders] (
    [ID]       UNIQUEIDENTIFIER CONSTRAINT [DF_HealthcareProviders_ID] DEFAULT (newid()) NOT NULL,
    [Name]     NVARCHAR (50)    NOT NULL,
    [IsActive] BIT              NOT NULL,
    CONSTRAINT [PK_HealthcareProviders] PRIMARY KEY CLUSTERED ([ID] ASC)
);

