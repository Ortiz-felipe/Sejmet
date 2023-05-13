using FluentValidation;

namespace Sejmet.API.Commands.Customers.Update
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.CustomerId).NotEmpty();

            this.RuleFor(x => x.Body).NotEmpty();
        }
    }
}
