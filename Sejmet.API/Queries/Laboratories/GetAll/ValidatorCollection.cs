
using FluentValidation;
using Sejmet.API.Errors.Laboratory;

namespace Sejmet.API.Queries.Laboratories.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.When(x => !string.IsNullOrWhiteSpace(x.LaboratoryName), () =>
            {
                this.RuleFor(x => x.LaboratoryName)
                    .NotEmpty()
                    .WithMessage(LaboratoryErrors.LaboratoryNameIsEmpty.Message);
            });
        }
    }
}
