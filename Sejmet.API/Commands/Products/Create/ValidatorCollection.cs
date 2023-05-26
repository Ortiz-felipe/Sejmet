using FluentValidation;
using Sejmet.API.Errors.Product;

namespace Sejmet.API.Commands.Products.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(ProductErrors.CreateProductBodyIsEmpty.Message)
                .When(x => x.Body == null);

            this.RuleFor(x => x.Body.TradeName)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductTradeNameIsEmpty.Message);

            this.RuleFor(x => x.Body.Upc)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductUpcIsEmpty.Message);

            this.RuleFor(x => x.Body.LaboratoryId)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductLaboratoryIsEmpty.Message);

            this.RuleFor(x => x.Body.ActiveCompoundId)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductActiveCompoundIdIsEmpty.Message);

            this.RuleFor(x => x.Body.DosageFormId)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductDosageFormIdIsEmpty.Message);

            this.RuleFor(x => x.Body.Price)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductPriceIsEmpty.Message);

            this.RuleFor(x => x.Body.Container)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductContainerIsEmpty.Message);

            this.RuleFor(x => x.Body.Dosage)
                .NotEmpty()
                .WithMessage(ProductErrors.ProductDosageIsEmpty.Message);

            
        }
    }
}
