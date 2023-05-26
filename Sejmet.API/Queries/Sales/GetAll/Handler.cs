using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Sales;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Sales.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly ISalesRepository _salesRepository;

        public Handler(ISalesRepository salesRepository)
        {
            _salesRepository = salesRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var sales = await _salesRepository.GetAllSalesAsync(request.CustomerName, cancellationToken);
                return this.Ok(sales);
            }
            catch (Exception )
            {
                return this.InternalServerError(SaleErrors.GetAllSalesError);
            }
        }
    }
}
