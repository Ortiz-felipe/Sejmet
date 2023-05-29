using FluentValidation;
using Sejmet.API.Errors.Product;

namespace Sejmet.API.Queries.Products.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.SearchExpression)
                .NotNull()
                .WithMessage(ProductErrors.ProductSearchExpressionIsEmpty.Message)
                .When(x => !string.IsNullOrWhiteSpace(x.SearchExpression));

            this.RuleFor(x => x.CurrentPage)
                .NotEmpty();

            this.RuleFor(x => x.PageSize)
                .NotEmpty();
        }
    }
}
