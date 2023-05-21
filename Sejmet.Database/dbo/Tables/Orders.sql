CREATE TABLE [dbo].[Orders] (
    [ID]                  UNIQUEIDENTIFIER CONSTRAINT [DF_Orders_ID] DEFAULT (newid()) NOT NULL,
    [ProviderID]          UNIQUEIDENTIFIER NOT NULL,
    [TotalAmount]         DECIMAL (19, 4)  NOT NULL,
    [OrderDate]           DATETIME2 (7)    NOT NULL,
    [RecievedDate]        DATETIME2 (7)    NOT NULL,
    [TransactionStatusID] INT              NOT NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Orders_Providers] FOREIGN KEY ([ProviderID]) REFERENCES [dbo].[Providers] ([ID]),
    CONSTRAINT [FK_Orders_TransactionStatuses] FOREIGN KEY ([TransactionStatusID]) REFERENCES [dbo].[TransactionStatuses] ([ID])
);

