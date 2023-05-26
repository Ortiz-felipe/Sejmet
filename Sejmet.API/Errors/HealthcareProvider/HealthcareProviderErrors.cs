namespace Sejmet.API.Errors.HealthcareProvider
{
    public static class HealthcareProviderErrors
    {
        public static ApiError GetAllHealthcareProvidersError => new(MajorErrorCodes.HealthcareProviders, 1,
            "Get all healthcare providers failed");

        public static ApiError CreateHealthcareProviderError => new(MajorErrorCodes.HealthcareProviders, 2,
            "Create new healthcare provider failed");

        public static ApiError PatchHealthcareProviderError =>
            new(MajorErrorCodes.HealthcareProviders, 3, "Patch healthcare provider failed");

        public static ApiError HealthcareProviderNotFound =>
            new(MajorErrorCodes.HealthcareProviders, 4, "Healthcare provider was not found");

        public static ApiError CreateHealthcareProviderBodyIsEmpty => new(MajorErrorCodes.HealthcareProviders, 5,
            "Create Healthcare body cannot be empty");

        public static ApiError HealthcareProviderNameIsEmpty => new(MajorErrorCodes.HealthcareProviders, 6,
            "New Healthcare provider name cannot be empty");

        public static ApiError HealthcareProviderIdIsEmpty => new(MajorErrorCodes.HealthcareProviders, 7,
            "Healthcare provider ID cannot be empty");
    }
}
