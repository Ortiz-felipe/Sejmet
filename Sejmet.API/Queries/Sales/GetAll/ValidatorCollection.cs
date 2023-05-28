using FluentValidation;
using Sejmet.API.Errors.Sales;

namespace Sejmet.API.Queries.Sales.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.CustomerName)
                .NotEmpty()
                .WithMessage(SaleErrors.SaleCustomerNameIsEmpty.Message)
                .When(x => !string.IsNullOrWhiteSpace(x.CustomerName));

            this.RuleFor(x => x.Skip)
                .GreaterThan(-1)
                .WithMessage(SaleErrors.GetAllCustomersSkipIsEmpty.Message);

            this.RuleFor(x => x.Take)
                .NotEmpty()
                .WithMessage(SaleErrors.GetAllCustomersTakeIsEmpty.Message);
        }
    }
}
