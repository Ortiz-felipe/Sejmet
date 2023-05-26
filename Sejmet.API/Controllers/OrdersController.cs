using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Orders.Create;
using Sejmet.API.Models.DTOs.Orders;
using Sejmet.API.Queries.Orders.GetAll;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IMediator mediator;

        public OrdersController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IList<OrderDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllOrdersAsync([FromQuery] QueryRequest queryRequest)
        {
            return await mediator.Send(queryRequest).ConfigureAwait(false);
        }

        [HttpGet]
        [Route("OrderId/{OrderId}")]
        [ProducesResponseType(typeof(OrderDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetOrderByIdAsync([FromRoute] Queries.Orders.GetById.QueryRequest queryRequest)
        {
            return await mediator.Send(queryRequest).ConfigureAwait(false);
        }

        [HttpPost]
        [ProducesResponseType(typeof(CreateOrderDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateOrderAsync([FromBody] CommandRequest commandRequest)
        {
            return await mediator.Send(commandRequest).ConfigureAwait(false);
        }

        [HttpPatch]
        [ProducesResponseType(typeof(CreateOrderDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateOrderStatusAsync(
            [FromBody] Commands.Orders.Update.CommandRequest commandRequest)
        {
            return await mediator.Send(commandRequest).ConfigureAwait(false);
        }
    }
}
