using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs.Products;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ProductsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IList<ProductDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllProductsAsync([FromQuery]Queries.Products.GetAll.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("ProductCode/{ProductCode}")]
        [ProducesResponseType(typeof(ProductDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetProductByProductCodeAsync([FromRoute]Queries.Products.GetByProductCode.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpPost]
        [ProducesResponseType(typeof(ProductDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateProductAsync([FromBody]Commands.Products.Create.CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest);
        }
    }
}
