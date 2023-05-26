using FluentValidation;
using Sejmet.API.Errors.Customer;

namespace Sejmet.API.Commands.Customers.Update
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.CustomerId)
                .NotEmpty()
                .WithMessage(CustomerErrors.CustomerIdIsEmpty.Message);

            this.RuleFor(x => x.Body)
                .NotEmpty()
                .WithMessage(CustomerErrors.UpdateCustomerBodyIsEmpty.Message);
        }
    }
}
