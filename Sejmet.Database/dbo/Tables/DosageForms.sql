﻿CREATE TABLE [dbo].[DosageForms] (
    [ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_DosageForms] PRIMARY KEY CLUSTERED ([ID] ASC)
);

