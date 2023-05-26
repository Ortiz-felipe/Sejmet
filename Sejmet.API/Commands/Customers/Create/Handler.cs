using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Customer;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Customers.Create
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly ICustomersRepository _customersRepository;

        public Handler(ICustomersRepository customersRepository)
        {
            _customersRepository = customersRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var createdCustomer = await _customersRepository.CreateCustomerAsync(request.Body, cancellationToken);
                return new CreatedAtRouteResult(createdCustomer.Id, createdCustomer);
            }
            catch (Exception)
            {
                return this.InternalServerError(CustomerErrors.CreateNewCustomerError);
            }
        }
    }
}
