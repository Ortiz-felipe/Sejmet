namespace Sejmet.API.Errors.Provider
{
    public static class ProviderErrors
    {
        public static ApiError GetAllProvidersError =>
            new(MajorErrorCodes.Providers, 1, "Get all providers has failed");
    }
}
