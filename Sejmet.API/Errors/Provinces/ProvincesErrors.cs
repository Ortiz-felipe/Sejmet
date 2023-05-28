namespace Sejmet.API.Errors.Provinces
{
    public static class ProvincesErrors
    {
        public static ApiError GetAllProvincesError =>
            new(MajorErrorCodes.Provinces, 1, "Get all provinces has failed");
    }
}
