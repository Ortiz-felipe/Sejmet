CREATE TABLE [dbo].[TransactionStatuses] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TransactionStatuses] PRIMARY KEY CLUSTERED ([ID] ASC)
);

