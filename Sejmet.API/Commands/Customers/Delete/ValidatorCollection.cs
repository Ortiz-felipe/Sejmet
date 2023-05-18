using FluentValidation;

namespace Sejmet.API.Commands.Customers.Delete
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.CustomerId).NotEmpty();
        }
    }
}
