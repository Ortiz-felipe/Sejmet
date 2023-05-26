using FluentValidation;
using Sejmet.API.Errors.Laboratory;

namespace Sejmet.API.Commands.Laboratories.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(LaboratoryErrors.CreateLaboratoryBodyIsEmpty.Message);

            this.RuleFor(x => x.Body.Name)
                .NotEmpty()
                .WithMessage(LaboratoryErrors.LaboratoryNameIsEmpty.Message);
        }
    }
}
