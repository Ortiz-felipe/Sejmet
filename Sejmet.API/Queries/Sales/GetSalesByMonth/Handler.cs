using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Sales;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Sales.GetSalesByMonth
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
                var result = await _salesRepository.GetSalesByMonthAsync(request.Year, cancellationToken);
                return this.Ok(result);
            }
            catch (Exception)
            {
                return this.InternalServerError(SaleErrors.GetSalesByMonthError);
            }
        }
    }
}
