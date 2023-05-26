namespace Sejmet.API.Errors.Laboratory
{
    public static class LaboratoryErrors
    {
        public static ApiError GetAllLaboratoriesError =>
            new(MajorErrorCodes.Laboratories, 1, "Get all laboratories failed");

        public static ApiError CreateNewLaboratoryError =>
            new(MajorErrorCodes.Laboratories, 2, "Create new laboratory failed");

        public static ApiError LaboratoryNameIsEmpty =>
            new(MajorErrorCodes.Laboratories, 3, "Laboratory name cannot be empty");

        public static ApiError CreateLaboratoryBodyIsEmpty =>
            new(MajorErrorCodes.Laboratories, 4, "Create laboratory body cannot be empty");
    }
}
