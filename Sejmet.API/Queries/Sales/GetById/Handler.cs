using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Sales;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Sales.GetById
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
            if (request.SaleId == Guid.Empty)
            {
                return this.BadRequest(SaleErrors.CreateSaleCustomerIdIsEmpty);
            }

            try
            {
                var sale = await _salesRepository.GetSaleByIdAsync(request.SaleId, cancellationToken);

                if (sale is null)
                {
                    return this.NotFound(SaleErrors.SaleNotFound);
                }

                return this.Ok(sale);
            }
            catch (Exception)
            {
                return this.InternalServerError(SaleErrors.GetSaleByIdError);
            }
        }
    }
}
