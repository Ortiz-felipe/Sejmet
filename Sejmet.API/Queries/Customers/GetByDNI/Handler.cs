using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Customer;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Customers.GetByDNI
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly ICustomersRepository _customersRepository;

        public Handler(ICustomersRepository customersRepository)
        {
            _customersRepository = customersRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var customer = await _customersRepository.GetCustomerByDniAsync(request.Dni, cancellationToken);
                return customer == null ? this.NotFound(CustomerErrors.CustomerNotFound) : this.Ok(customer);
            }
            catch (Exception)
            {
                return this.InternalServerError(CustomerErrors.GetCustomerByDniError);
            }
        }
    }
}
