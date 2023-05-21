CREATE TABLE [dbo].[Products] (
    [ID]               UNIQUEIDENTIFIER CONSTRAINT [DF_Products_ID] DEFAULT (newid()) NOT NULL,
    [UPC]              VARCHAR (20)     NOT NULL,
    [TradeName]        NVARCHAR (150)   NOT NULL,
    [LaboratoryID]     UNIQUEIDENTIFIER NOT NULL,
    [ActiveCompoundID] UNIQUEIDENTIFIER NOT NULL,
    [DosageFormID]     INT              NOT NULL,
    [Price]            DECIMAL (19, 4)  NOT NULL,
    [Container]        INT              NOT NULL,
    [Dosage]           INT              NOT NULL,
    [CurrentStock]     INT              NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Products_ActiveCompounds] FOREIGN KEY ([ActiveCompoundID]) REFERENCES [dbo].[ActiveCompounds] ([ID]),
    CONSTRAINT [FK_Products_DosageForms] FOREIGN KEY ([DosageFormID]) REFERENCES [dbo].[DosageForms] ([ID]),
    CONSTRAINT [FK_Products_Laboratories] FOREIGN KEY ([LaboratoryID]) REFERENCES [dbo].[Laboratories] ([ID])
);

