namespace Sejmet.API.Errors.Customer
{
    public static class CustomerErrors
    {
        public static ApiError InternalServerError => new(MajorErrorCodes.Customers, 1, "Unexpected error");

        public static ApiError GetAllCustomersError =>
            new(MajorErrorCodes.Customers, 2, "Get All Customers failed");

        public static ApiError CreateNewCustomerError =>
            new(MajorErrorCodes.Customers, 3, "Create new customer failed");

        public static ApiError UpdateCustomerError => new(MajorErrorCodes.Customers, 4, "Update customer failed");

        public static ApiError CustomerNameIsEmptyError =>
            new(MajorErrorCodes.Customers, 5, "Customer name cannot be empty");

        public static ApiError CustomerNameExceededLength =>
            new(MajorErrorCodes.Customers, 6, "Customer name length has been exceeded");

        public static ApiError CustomerCityIdIsEmpty =>
            new(MajorErrorCodes.Customers, 7, "Customer City ID cannot be empty");

        public static ApiError CustomerProvinceIdIsEmpty =>
            new(MajorErrorCodes.Customers, 8, "Customer Province ID cannot be empty");

        public static ApiError CreateNewCustomerBodyIsEmpty =>
            new(MajorErrorCodes.Customers, 9, "Create Customer Body cannot be empty");

        public static ApiError NewCustomerAddressIsEmpty =>
            new(MajorErrorCodes.Customers, 10, "New customer's address cannot be empty");

        public static ApiError NewCustomerBirthdateIsEmpty =>
            new(MajorErrorCodes.Customers, 11, "New customer's birthdate cannot be empty");

        public static ApiError NewCustomerBirthdateIsInvalid =>
            new(MajorErrorCodes.Customers, 12, "New customer's birthdate cannot be today");

        public static ApiError NewCustomerFirstNameIsEmpty =>
            new(MajorErrorCodes.Customers, 13, "New customer's first name cannot be empty");
        public static ApiError NewCustomerFirstNameLengthExceeded =>
            new(MajorErrorCodes.Customers, 14, "New customer's first name length exceeded");
        public static ApiError NewCustomerLastNameIsEmpty =>
            new(MajorErrorCodes.Customers, 15, "New customer's last name cannot be empty");
        public static ApiError NewCustomerLastNameLengthExceeded =>
            new(MajorErrorCodes.Customers, 16, "New customer's last name length exceeded");
        public static ApiError NewCustomerHealthcareProviderIsEmpty => new(MajorErrorCodes.Customers, 17,
            "New customer's healthcare provider cannot be empty");
        public static ApiError NewCustomerAgeIsEmpty =>
            new(MajorErrorCodes.Customers, 18, "New customer's age cannot be empty");
        public static ApiError NewCustomerPhoneNumberIsEmpty => new(MajorErrorCodes.Customers, 19,
            "New customer's phone number cannot be empty");

        public static ApiError CustomerIdIsEmpty => new(MajorErrorCodes.Customers, 20, "Customer's ID cannot be empty");

        public static ApiError UpdateCustomerBodyIsEmpty =>
            new(MajorErrorCodes.Customers, 21, "Update Customer's Body cannot be empty");

        public static ApiError CustomerNotFound =>
            new(MajorErrorCodes.Customers, 22, "Customer information was not found");
    }
}
