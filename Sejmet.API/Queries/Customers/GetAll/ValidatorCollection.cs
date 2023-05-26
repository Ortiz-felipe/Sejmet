using FluentValidation;
using Sejmet.API.Errors.Customer;

namespace Sejmet.API.Queries.Customers.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.When(model => model.CityID == Guid.Empty, () =>
            {
                this.RuleFor(x => x.CityID)
                    .NotEmpty()
                    .WithMessage(CustomerErrors.CustomerCityIdIsEmpty.Message);
            });

            this.When(model => model.ProvinceID > 0, () =>
            {
                this.RuleFor(x => x.ProvinceID)
                    .GreaterThan(0)
                    .WithMessage(CustomerErrors.CustomerProvinceIdIsEmpty.Message);
            });

            this.When(model => !string.IsNullOrWhiteSpace(model.Name), () =>
            {
                this.RuleFor(x => x.Name)
                    .NotEmpty()
                    .WithMessage(CustomerErrors.CustomerNameIsEmptyError.Message)
                    .MaximumLength(200)
                    .WithMessage(CustomerErrors.CustomerNameExceededLength.Message);
            });

        }
    }
}
