namespace Sejmet.API.Errors.Order
{
    public static class OrderErrors
    {
        public static ApiError GetAllOrdersError => new(MajorErrorCodes.Orders, 1, "Get all orders has failed");
        public static ApiError GetOrderByIdError => new(MajorErrorCodes.Orders, 2, "Get order by ID has failed");
        public static ApiError CreateNewOrderError => new(MajorErrorCodes.Orders, 3, "Create new order has failed");
        public static ApiError UpdateOrderError => new(MajorErrorCodes.Orders, 4, "Update order has failed");

        public static ApiError CreateNewOrderBodyIsEmpty =>
            new(MajorErrorCodes.Orders, 5, "Create new order body cannot be empty");

        public static ApiError UpdateOrderBodyIsEmpty =>
            new(MajorErrorCodes.Orders, 6, "Update order body cannot be empty");

        public static ApiError OrderProviderIsEmpty =>
            new(MajorErrorCodes.Orders, 7, "Order provider ID cannot be empty");

        public static ApiError OrderDateIsEmpty => new(MajorErrorCodes.Orders, 8, "Order date cannot be empty");

        public static ApiError OrderDateIsInvalid =>
            new(MajorErrorCodes.Orders, 9, "Order date cannot be greater than current date");

        public static ApiError OrderTotalAmountIsInvalid =>
            new(MajorErrorCodes.Orders, 10, "Order total amount is invalid");

        public static ApiError OrderTransactionStatusIdIsInvalid =>
            new(MajorErrorCodes.Orders, 11, "Order transaction ID is invalid");

        public static ApiError OrderedProductsIsEmpty =>
            new(MajorErrorCodes.Orders, 12, "Ordered products list cannot be empty");

        public static ApiError OrderProductIdIsEmpty => new(MajorErrorCodes.Orders, 13, "Product Id cannot be empty");

        public static ApiError OrderProductQuantityIsEmpty =>
            new(MajorErrorCodes.Orders, 14, "Ordered Product Quantity cannot be empty");

        public static ApiError OrderProductUnitPriceIsEmpty =>
            new(MajorErrorCodes.Orders, 15, "Ordered Product unit price cannot be empty");

        public static ApiError OrderIdIsEmpty => new(MajorErrorCodes.Orders, 16, "Order Id cannot be empty");

        public static ApiError OrderProviderNameIsEmpty =>
            new(MajorErrorCodes.Orders, 17, "Provider name cannot be empty");

        public static ApiError OrderCurrentPageIsEmpty =>
            new(MajorErrorCodes.Orders, 18, "Current page cannot be empty");

        public static ApiError OrderPageSizeIsEmpty => new(MajorErrorCodes.Orders, 19, "Page size cannot be empty");
        public static ApiError OrderIDNotFound => new(MajorErrorCodes.Orders, 20, "Order ID wasn't found");

        public static ApiError GetTopLatestOrderError =>
            new(MajorErrorCodes.Orders, 21, "Get top latest orders has failed");
    }
}
