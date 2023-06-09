﻿using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Orders.Create;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs;
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

        [HttpGet("", Name = "GetAllOrdersAsync")]
        [ProducesResponseType(typeof(PagedResponseDTO<OrderDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllOrdersAsync([FromQuery] QueryRequest queryRequest)
        {
            return await mediator.Send(queryRequest).ConfigureAwait(false);
        }

        [HttpGet("{OrderId}", Name = "GetOrderByIdAsync")]
        [ProducesResponseType(typeof(OrderDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetOrderByIdAsync([FromRoute] Queries.Orders.GetById.QueryRequest queryRequest)
        {
            return await mediator.Send(queryRequest).ConfigureAwait(false);
        }


        [HttpGet("GetTopLatestOrders", Name = "GetTopLatestOrdersAsync")]
        [ProducesResponseType(typeof(IList<LatestOrderDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetTopLatestOrdersAsync(
            [FromQuery] Queries.Orders.GetLatestOrders.QueryRequest queryRequest)
        {
            return await mediator.Send(queryRequest);
        }


        [HttpPost]
        [ProducesResponseType(typeof(CreateOrderDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateOrderAsync([FromBody] CommandRequest commandRequest)
        {
            return await mediator.Send(commandRequest).ConfigureAwait(false);
        }

        [HttpPatch]
        [ProducesResponseType(typeof(CreateOrderDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateOrderStatusAsync(
            [FromBody] Commands.Orders.Update.CommandRequest commandRequest)
        {
            return await mediator.Send(commandRequest).ConfigureAwait(false);
        }
    }
}
