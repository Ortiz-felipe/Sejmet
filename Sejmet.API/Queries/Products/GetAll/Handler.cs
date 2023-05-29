using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Product;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Products.GetAll
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
                var products = await _productsRepository.GetProductsAsync(request.SearchExpression, request.CurrentPage, request.PageSize, cancellationToken).ConfigureAwait(false);
                return this.Ok(products);
            }
            catch (Exception)
            {
                return this.InternalServerError(ProductErrors.GetAllProductsError);
            }
            
        }
    }
}
