
using FluentValidation;
using Sejmet.API.Errors.Sales;

namespace Sejmet.API.Queries.Sales.GetSalesByMonth
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Year)
                .LessThanOrEqualTo(DateTime.Now.Year)
                .WithMessage(SaleErrors.GetSalesByMonthInvalidYear.Message);
        }
    }
}
