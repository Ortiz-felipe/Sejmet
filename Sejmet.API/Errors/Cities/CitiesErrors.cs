namespace Sejmet.API.Errors.Cities
{
    public static class CitiesErrors
    {
        public static ApiError GetAllCitiesError => new(MajorErrorCodes.Cities, 1, "Get all cities has failed");
    }
}
