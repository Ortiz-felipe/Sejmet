using FluentValidation;

namespace Sejmet.API.Queries.Products.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.When(x => !string.IsNullOrWhiteSpace(x.SearchExpression), () =>
            {
                this.RuleFor(x => x.SearchExpression)
                    .NotEmpty();
            });
            
        }
    }
}
