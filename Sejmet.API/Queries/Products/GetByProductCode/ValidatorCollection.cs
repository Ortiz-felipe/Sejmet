using FluentValidation;

namespace Sejmet.API.Queries.Products.GetByProductCode
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.ProductCode)
                .NotEmpty();
        }
    }
}
