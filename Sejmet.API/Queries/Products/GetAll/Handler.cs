using MediatR;
using Microsoft.AspNetCore.Mvc;
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
                var products = await _productsRepository.GetProductsAsync(request.SearchExpression, cancellationToken).ConfigureAwait(false);

                return new OkObjectResult(products);
            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
            
        }
    }
}
