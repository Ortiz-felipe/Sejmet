using FluentValidation;
using Sejmet.API.Errors.Order;

namespace Sejmet.API.Commands.Orders.Update
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(OrderErrors.UpdateOrderBodyIsEmpty.Message);

            this.RuleFor(x => x.Body.OrderId)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderIdIsEmpty.Message);

            this.RuleFor(x => x.Body.TransactionStatusId)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderTransactionStatusIdIsInvalid.Message);
        }
    }
}
