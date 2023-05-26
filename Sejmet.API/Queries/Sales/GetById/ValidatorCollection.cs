using FluentValidation;
using Sejmet.API.Errors.Sales;

namespace Sejmet.API.Queries.Sales.GetById
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.SaleId)
                .NotEmpty()
                .WithMessage(SaleErrors.CreateSaleCustomerIdIsEmpty.Message);
        }
    }
}
