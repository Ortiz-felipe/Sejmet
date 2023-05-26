using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Product;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Products.Create
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly IProductsRepository _productsRepository;

        public Handler(IProductsRepository productsRepository)
        {
            _productsRepository = productsRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            if (request.Body is null)
            {
                return this.BadRequest(ProductErrors.CreateProductBodyIsEmpty);
            }

            try
            {
                var createdProduct = await _productsRepository.CreateProductAsync(request.Body, cancellationToken);
                return this.CreatedAtRoute("products", createdProduct.Id, createdProduct);
            }
            catch (Exception e)
            {
                return this.InternalServerError(ProductErrors.CreateProductError);
            }
        }
    }
}
