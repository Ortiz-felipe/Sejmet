﻿using FluentValidation;
using Sejmet.API.Errors.Sales;

namespace Sejmet.API.Queries.Sales.GetAll
{
    public class ValidatorCollection : AbstractValidator<QueryRequest>
    {
        public ValidatorCollection()
        {
            this.ClassLevelCascadeMode = CascadeMode.Stop;

            this.RuleFor(x => x.CustomerName)
                .NotEmpty()
                .WithMessage(SaleErrors.SaleCustomerNameIsEmpty.Message)
                .When(x => !string.IsNullOrWhiteSpace(x.CustomerName));

            this.RuleFor(x => x.CurrentPage)
                .NotEmpty()
                .WithMessage(SaleErrors.GetAllCustomersCurrentPageIsEmpty.Message);

            this.RuleFor(x => x.PageSize)
                .NotEmpty()
                .WithMessage(SaleErrors.GetAllCustomersPageSizeIsEmpty.Message);
        }
    }
}
