namespace Sejmet.API.Errors.Product
{
    public static class ProductErrors
    {
        public static ApiError GetAllProductsError => new(MajorErrorCodes.Products, 1, "Get all products has failed");

        public static ApiError GetByProductByIdError =>
            new(MajorErrorCodes.Products, 2, "Get product by ID has failed");

        public static ApiError CreateProductError => new(MajorErrorCodes.Products, 3, "Create product has failed");

        public static ApiError CreateProductBodyIsEmpty =>
            new(MajorErrorCodes.Products, 4, "Create product body cannot be empty");

        public static ApiError ProductTradeNameIsEmpty => new(MajorErrorCodes.Products, 5, "Product trade name cannot be empty");
        public static ApiError ProductUpcIsEmpty => new(MajorErrorCodes.Products, 6, "Product UPC cannot be empty");

        public static ApiError ProductLaboratoryIsEmpty =>
            new(MajorErrorCodes.Products, 7, "Product Laboratory Id cannot be empty");

        public static ApiError ProductActiveCompoundIdIsEmpty =>
            new(MajorErrorCodes.Products, 8, "Product Active Compound Id cannot be empty");

        public static ApiError ProductDosageFormIdIsEmpty =>
            new(MajorErrorCodes.Products, 9, "Product Dosage Form Id cannot be empty");

        public static ApiError ProductPriceIsEmpty =>
            new(MajorErrorCodes.Products, 10, "Product Price cannot be empty");

        public static ApiError ProductContainerIsEmpty =>
            new(MajorErrorCodes.Products, 11, "Product Container cannot be empty");

        public static ApiError ProductDosageIsEmpty =>
            new(MajorErrorCodes.Products, 12, "Product Dosage cannot be empty");

        public static ApiError ProductSearchExpressionIsEmpty =>
            new(MajorErrorCodes.Products, 13, "Product Search Expression cannot be empty");

        public static ApiError ProductIdIsEmpty => new(MajorErrorCodes.Products, 14, "Product Id cannot be empty");
        public static ApiError ProductNotFound => new(MajorErrorCodes.Products, 15, "Product does not exists");

        public static ApiError GetTopSoldProductsError =>
            new(MajorErrorCodes.Products, 16, "Get Top Sold Products has failed");

        public static ApiError GetTopProductsInCriticalStockError => new(MajorErrorCodes.Products, 17,
            "Get top products in critical stock has failed");
    }
}
