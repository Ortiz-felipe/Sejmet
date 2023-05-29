using FluentValidation;
using Sejmet.API.Errors.Order;

namespace Sejmet.API.Queries.Orders.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.ProviderName)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderProviderNameIsEmpty.Message)
                .When(x => !string.IsNullOrWhiteSpace(x.ProviderName));

            this.RuleFor(x => x.CurrentPage)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderCurrentPageIsEmpty.Message);

            this.RuleFor(x => x.PageSize)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderPageSizeIsEmpty.Message);
        }
    }
}
