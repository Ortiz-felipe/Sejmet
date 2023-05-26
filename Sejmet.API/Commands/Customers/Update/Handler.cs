using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Customer;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Customers.Update
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
                var updatedCustomer = await _customersRepository.UpdateCustomerAsync(request.CustomerId, request.Body, cancellationToken);

                if (updatedCustomer is null)
                {
                    return this.NotFound(CustomerErrors.CustomerNotFound);
                }
                return this.Ok(updatedCustomer);

            }
            catch (Exception)
            {
                return this.InternalServerError(CustomerErrors.UpdateCustomerError);
            }
        }
    }
}
