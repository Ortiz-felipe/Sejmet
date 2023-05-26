using FluentValidation;
using Sejmet.API.Errors.HealthcareProvider;

namespace Sejmet.API.Commands.HealthcareProviders.Patch
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.ProviderID)
                .NotEmpty()
                .WithMessage(HealthcareProviderErrors.HealthcareProviderIdIsEmpty.Message);
        }
    }
}
