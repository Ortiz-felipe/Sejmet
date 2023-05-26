using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Sales;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Sales.Create
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly ISalesRepository _salesRepository;

        public Handler(ISalesRepository salesRepository)
        {
            _salesRepository = salesRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            if (request.Body is null)
            {
                return this.BadRequest(SaleErrors.CreateSaleBodyIsEmpty);
            }

            try
            {
                var createdSale = await _salesRepository.CreateSaleAsync(request.Body, cancellationToken);
                return this.CreatedAtRoute("sales", createdSale.SaleId, createdSale);
            }
            catch (Exception)
            {
                return this.InternalServerError(SaleErrors.CreateSaleError);
            }

        }
    }
}
