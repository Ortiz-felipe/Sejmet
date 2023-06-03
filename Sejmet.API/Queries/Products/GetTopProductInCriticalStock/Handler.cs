using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Product;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Products.GetTopProductInCriticalStock
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly IProductsRepository _productsRepository;

        public Handler(IProductsRepository productsRepository)
        {
            _productsRepository = productsRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var criticalStockProducts = await _productsRepository.GetTopProductsInCriticalStock(cancellationToken);

                return this.Ok(criticalStockProducts);
            }
            catch (Exception)
            {
                return this.InternalServerError(ProductErrors.GetTopProductsInCriticalStockError);
            }
        }
    }
}
