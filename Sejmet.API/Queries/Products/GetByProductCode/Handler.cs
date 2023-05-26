using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Product;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Products.GetByProductCode
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
                var product = await _productsRepository.GetProductByUPCAsync(request.ProductCode, cancellationToken);

                return product is null ? this.NotFound(ProductErrors.ProductNotFound) : this.Ok(product);
            }
            catch (Exception)
            {
                return this.InternalServerError(ProductErrors.GetByProductByIdError);
            }
        }
    }
}
