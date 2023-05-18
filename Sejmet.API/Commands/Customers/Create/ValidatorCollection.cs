using FluentValidation;

namespace Sejmet.API.Commands.Customers.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull();

            this.RuleFor(x => x.Body.Address)
                .NotEmpty();
            this.RuleFor(x => x.Body.Birthdate)
                .NotEmpty()
                .Must(x => x != DateTime.UtcNow);
            this.RuleFor(x => x.Body.FirstName)
                .NotEmpty()
                .MaximumLength(200);
            this.RuleFor(x => x.Body.LastName)
                .MaximumLength(200);
            this.RuleFor(x => x.Body.HealthCareProviderId)
                .NotEmpty();
            this.RuleFor(x => x.Body.Age)
                .GreaterThan(0);
            this.RuleFor(x => x.Body.CityId)
                .NotEmpty();
            this.RuleFor(x => x.Body.ProvinceId)
                .GreaterThan(0);
            this.RuleFor(x => x.Body.PhoneNumber)
                .NotEmpty();
        }
    }
}
