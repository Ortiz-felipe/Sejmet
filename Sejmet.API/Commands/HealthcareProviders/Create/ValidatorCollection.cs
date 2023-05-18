using FluentValidation;

namespace Sejmet.API.Commands.HealthcareProviders.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull();

            this.RuleFor(x => x.Body.Name)
                .NotEmpty();
        }
    }
}
