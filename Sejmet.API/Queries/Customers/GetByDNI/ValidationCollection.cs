using FluentValidation;
using Sejmet.API.Errors.Customer;

namespace Sejmet.API.Queries.Customers.GetByDNI
{
    public class ValidationCollection : AbstractValidator<QueryRequest>
    {
        public ValidationCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Dni)
                .NotEmpty()
                .WithMessage(CustomerErrors.CustomerDniIsEmpty.Message);
        }
    }
}
