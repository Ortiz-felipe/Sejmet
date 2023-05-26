using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Sales.Create;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Queries.Sales.GetAll;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalesController : ControllerBase
    {
        private readonly IMediator _mediator;

        public SalesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IList<SaleDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllSalesAsync(QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("SaleId/{SaleId}")]
        [ProducesResponseType(typeof(SaleDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetSaleByIdAsync(Queries.Sales.GetById.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpPost]
        [ProducesResponseType(typeof(CreateSaleDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateSaleAsync(CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest);
        }
    }
}
