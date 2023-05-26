using FluentValidation;
using Sejmet.API.Errors.Customer;

namespace Sejmet.API.Commands.Customers.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.RuleLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(CustomerErrors.CreateNewCustomerBodyIsEmpty.Message);

            this.RuleFor(x => x.Body.Address)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerAddressIsEmpty.Message);
            this.RuleFor(x => x.Body.Birthdate)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerBirthdateIsEmpty.Message)
                .Must(x => x != DateTime.UtcNow)
                .WithMessage(CustomerErrors.NewCustomerBirthdateIsInvalid.Message);
                
            this.RuleFor(x => x.Body.FirstName)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerFirstNameIsEmpty.Message)
                .MaximumLength(200)
                .WithMessage(CustomerErrors.NewCustomerFirstNameLengthExceeded.Message);
            this.RuleFor(x => x.Body.LastName)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerLastNameIsEmpty.Message)
                .MaximumLength(200)
                .WithMessage(CustomerErrors.NewCustomerLastNameLengthExceeded.Message);
            this.RuleFor(x => x.Body.HealthCareProviderId)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerHealthcareProviderIsEmpty.Message);
            this.RuleFor(x => x.Body.Age)
                .GreaterThan(0)
                .WithMessage(CustomerErrors.NewCustomerAgeIsEmpty.Message);
            this.RuleFor(x => x.Body.CityId)
                .NotEmpty()
                .WithMessage(CustomerErrors.CustomerCityIdIsEmpty.Message);
            this.RuleFor(x => x.Body.ProvinceId)
                .GreaterThan(0)
                .WithMessage(CustomerErrors.CustomerProvinceIdIsEmpty.Message);
            this.RuleFor(x => x.Body.PhoneNumber)
                .NotEmpty()
                .WithMessage(CustomerErrors.NewCustomerPhoneNumberIsEmpty.Message);
        }
    }
}
