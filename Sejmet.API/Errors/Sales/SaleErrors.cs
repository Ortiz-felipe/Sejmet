namespace Sejmet.API.Errors.Sales
{
    public static class SaleErrors
    {
        public static ApiError GetAllSalesError => new(MajorErrorCodes.Sales, 1, "Get all sales has failed");
        public static ApiError GetSaleByIdError => new(MajorErrorCodes.Sales, 2, "Get Sale by Id has failed");
        public static ApiError CreateSaleError => new(MajorErrorCodes.Sales, 3, "Create sale has failed");
        public static ApiError UpdateSaleError => new(MajorErrorCodes.Sales, 4, "Update sale has failed");
        public static ApiError CreateSaleBodyIsEmpty => new(MajorErrorCodes.Sales, 5, "Create Sale Body is empty");

        public static ApiError CreateSaleCustomerIdIsEmpty =>
            new(MajorErrorCodes.Sales, 6, "Customer Id cannot be empty");

        public static ApiError CreateSaleDateIsEmpty => new(MajorErrorCodes.Sales, 7, "Sale date cannot be empty");
        public static ApiError CreateSaleDateIsInvalid => new(MajorErrorCodes.Sales, 8, "Sale date is invalid");

        public static ApiError CreateSaleTotalAmountIsEmpty =>
            new(MajorErrorCodes.Sales, 9, "Sale total amount cannot be empty");

        public static ApiError CreateSaleTotalAmountIsInvalid =>
            new(MajorErrorCodes.Sales, 10, "Sale total amount is invalid");

        public static ApiError CreateSaleProductsIsEmpty =>
            new(MajorErrorCodes.Sales, 11, "Sale products collection cannot be empty");

        public static ApiError SaleProductIdIsEmpty => new(MajorErrorCodes.Sales, 12, "Product Id cannot be empty");

        public static ApiError SaleProductQuantityIsEmpty =>
            new(MajorErrorCodes.Sales, 13, "Product Quantity cannot be empty");

        public static ApiError SaleProductUnitPriceIsEmpty =>
            new(MajorErrorCodes.Sales, 14, "Product Unit Price cannot be empty");

        public static ApiError SaleCustomerNameIsEmpty =>
            new(MajorErrorCodes.Sales, 15, "Customer name cannot be empty");

        public static ApiError SaleNotFound => new(MajorErrorCodes.Sales, 16, "Sale cannot be found");
    }
}
