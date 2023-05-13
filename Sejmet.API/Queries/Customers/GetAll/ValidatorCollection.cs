using FluentValidation;

namespace Sejmet.API.Queries.Customers.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.When(model => model.CityID != null, () =>
            {
                RuleFor(x => x.CityID).NotEmpty();
            });

            this.When(model => model.ProvinceID > 0, () =>
            {
                RuleFor(x => x.ProvinceID).GreaterThanOrEqualTo(1);
            });

            this.When(model => model.FirstName != null, () =>
            {
                RuleFor(x => x.FirstName).NotEmpty()
                                         .MaximumLength(200);
            });

            this.When(model => model.LastName != null, () =>
            {
                RuleFor(x => x.LastName).NotEmpty()
                                        .MaximumLength(200);
            });
                
        }
    }
}
