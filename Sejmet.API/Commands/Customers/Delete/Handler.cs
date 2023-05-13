using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Customers.Delete
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
                var deletedCustomer = _customersRepository.DeleteCustomerAsync(request.CustomerId, cancellationToken);

                if (deletedCustomer is null)
                {
                    return new NotFoundObjectResult(deletedCustomer);
                }

                return new OkObjectResult(deletedCustomer);
            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
            
        }
    }
}
