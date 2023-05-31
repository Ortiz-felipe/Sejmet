﻿using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Sales.Create;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs;
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
        [ProducesResponseType(typeof(PagedResponseDTO<SaleDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllSalesAsync([FromQuery]QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("{Id}")]
        [ProducesResponseType(typeof(SaleDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetSaleByIdAsync([FromQuery] Queries.Sales.GetById.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpGet]
        [Route("GetSalesByMonth/{Year}")]
        [ProducesResponseType(typeof(IList<SalesByMonthDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetSalesByMonthAsync(
            [FromRoute] Queries.Sales.GetSalesByMonth.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpPost]
        [ProducesResponseType(typeof(CreateSaleDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateSaleAsync([FromBody]CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest);
        }
    }
}
