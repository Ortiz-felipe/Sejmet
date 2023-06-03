using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Queries.Products.GetTopSoldProducts;

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
        [ProducesResponseType(typeof(PagedResponseDTO<ProductDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllProductsAsync([FromQuery]Queries.Products.GetAll.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("TopSoldProducts")]
        [ProducesResponseType(typeof(IList<TopSoldProductDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetTopSoldProductsAsync([FromQuery]QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("CriticalStockProducts")]
        [ProducesResponseType(typeof(IList<CriticalStockProductDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetCriticalStockProductsAsync(
            [FromQuery] Queries.Products.GetTopProductInCriticalStock.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("{ProductCode}")]
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
