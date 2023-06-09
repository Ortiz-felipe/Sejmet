﻿using FluentValidation;
using Sejmet.API.Errors.HealthcareProvider;

namespace Sejmet.API.Commands.HealthcareProviders.Create
{
    public class ValidatorCollection : AbstractValidator<CommandRequest>
    {
        public ValidatorCollection() 
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.Body)
                .NotNull()
                .WithMessage(HealthcareProviderErrors.CreateHealthcareProviderBodyIsEmpty.Message);

            this.RuleFor(x => x.Body.Name)
                .NotEmpty()
                .WithMessage(HealthcareProviderErrors.HealthcareProviderNameIsEmpty.Message);
        }
    }
}
