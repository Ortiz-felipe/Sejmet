CREATE TABLE [dbo].[OrderProducts] (
    [OrderID]   UNIQUEIDENTIFIER NOT NULL,
    [ProductID] UNIQUEIDENTIFIER NOT NULL,
    [Quantity]  INT              NOT NULL,
    [UnitPrice] DECIMAL (19, 4)  NOT NULL,
    CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_OrderProducts_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([ID]),
    CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID])
);

