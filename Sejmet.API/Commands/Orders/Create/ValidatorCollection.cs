using FluentValidation;
using Sejmet.API.Errors.Order;

namespace Sejmet.API.Commands.Orders.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(OrderErrors.CreateNewOrderBodyIsEmpty.Message);

            this.RuleFor(x => x.Body.ProviderId)
                .NotNull()
                .WithMessage(OrderErrors.OrderProviderIsEmpty.Message);

            this.RuleFor(x => x.Body.OrderDate)
                .NotNull()
                .WithMessage(OrderErrors.OrderDateIsEmpty.Message)
                .LessThanOrEqualTo(DateTime.UtcNow)
                .WithMessage(OrderErrors.OrderDateIsInvalid.Message);

            this.RuleFor(x => x.Body.TotalAmount)
                .GreaterThan(0)
                .WithMessage(OrderErrors.OrderTotalAmountIsInvalid.Message);

            this.RuleFor(x => x.Body.TransactionStatusId)
                .GreaterThan(0)
                .WithMessage(OrderErrors.OrderTransactionStatusIdIsInvalid.Message);

            this.RuleFor(x => x.Body.OrderedProducts)
                .NotEmpty()
                .WithMessage(OrderErrors.OrderedProductsIsEmpty.Message);

            this.RuleForEach(x => x.Body.OrderedProducts).ChildRules(product =>
            {
                product.RuleFor(x => x.ProductID)
                    .NotEmpty()
                    .WithMessage(OrderErrors.OrderProductIdIsEmpty.Message);
                product.RuleFor(x => x.Quantity)
                    .NotEmpty()
                    .WithMessage(OrderErrors.OrderProductQuantityIsEmpty.Message);
                product.RuleFor(x => x.UnitPrice)
                    .NotEmpty()
                    .WithMessage(OrderErrors.OrderProductUnitPriceIsEmpty.Message);
            });
        }
    }
}
