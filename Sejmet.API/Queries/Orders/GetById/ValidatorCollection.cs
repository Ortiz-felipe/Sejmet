using FluentValidation;
using Sejmet.API.Errors.Order;

namespace Sejmet.API.Queries.Orders.GetById
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.OrderId)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderIdIsEmpty.Message);
        }
    }
}
