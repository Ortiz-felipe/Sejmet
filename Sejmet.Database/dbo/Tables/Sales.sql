CREATE TABLE [dbo].[Sales] (
    [ID]                  UNIQUEIDENTIFIER CONSTRAINT [DF_Sales_ID] DEFAULT (newid()) NOT NULL,
    [CustomerID]          UNIQUEIDENTIFIER NOT NULL,
    [TotalAmount]         DECIMAL (19, 4)  NOT NULL,
    [SaleDate]            DATETIME2 (7)    NOT NULL,
    [TransactionStatusID] INT              NULL,
    CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID]),
    CONSTRAINT [FK_Sales_TransactionStatuses] FOREIGN KEY ([TransactionStatusID]) REFERENCES [dbo].[TransactionStatuses] ([ID])
);

