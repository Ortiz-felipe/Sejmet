using MediatR;
using Microsoft.AspNetCore.Mvc;
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
                    return new NotFoundObjectResult(request.Body);
                }
                return new OkObjectResult(updatedCustomer);

            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
        }
    }
}
