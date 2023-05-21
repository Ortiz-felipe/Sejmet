CREATE TABLE [dbo].[SaleProducts] (
    [SaleID]    UNIQUEIDENTIFIER NOT NULL,
    [ProductID] UNIQUEIDENTIFIER NOT NULL,
    [Quantity]  INT              NOT NULL,
    [UnitPrice] DECIMAL (19, 4)  NOT NULL,
    CONSTRAINT [PK_SaleProducts] PRIMARY KEY CLUSTERED ([SaleID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_SaleProducts_Products1] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),
    CONSTRAINT [FK_SaleProducts_Sales1] FOREIGN KEY ([SaleID]) REFERENCES [dbo].[Sales] ([ID])
);

