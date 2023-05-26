using FluentValidation;
using Sejmet.API.Errors.Sales;

namespace Sejmet.API.Commands.Sales.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(SaleErrors.CreateSaleBodyIsEmpty.Message);
            
            this.RuleFor(x => x.Body.CustomerID)
                .NotNull()
                .WithMessage(SaleErrors.CreateSaleCustomerIdIsEmpty.Message);

            this.RuleFor(x => x.Body.SaleDate)
                .NotNull()
                .WithMessage(SaleErrors.CreateSaleDateIsEmpty.Message)
                .LessThanOrEqualTo(DateTime.UtcNow)
                .WithMessage(SaleErrors.CreateSaleDateIsInvalid.Message);

            this.RuleFor(x => x.Body.TotalAmount)
                .GreaterThan(0)
                .WithMessage(SaleErrors.CreateSaleTotalAmountIsEmpty.Message)
                .Equal(x => x.Body.SoldProducts.Sum(x => x.UnitPrice * x.Quantity))
                .WithMessage(SaleErrors.CreateSaleTotalAmountIsInvalid.Message);

            this.RuleFor(x => x.Body.SoldProducts)
                .NotEmpty()
                .WithMessage(SaleErrors.CreateSaleProductsIsEmpty.Message);

            this.RuleForEach(x => x.Body.SoldProducts).ChildRules(product =>
            {
                product.RuleFor(x => x.ProductID)
                    .NotEmpty()
                    .WithMessage(SaleErrors.SaleProductIdIsEmpty.Message);
                product.RuleFor(x => x.Quantity)
                    .NotEmpty()
                    .WithMessage(SaleErrors.SaleProductQuantityIsEmpty.Message);
                product.RuleFor(x => x.UnitPrice)
                    .NotEmpty()
                    .WithMessage(SaleErrors.SaleProductUnitPriceIsEmpty.Message);

            });
        }
    }
}
