using MediatR;
using Microsoft.AspNetCore.Mvc;
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
                var product = _productsRepository.GetProductByUPCAsync(request.ProductCode, cancellationToken);

                if (product is null)
                {
                    return new NotFoundObjectResult(request.ProductCode);
                }

                return new OkObjectResult(product);
            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
        }
    }
}
