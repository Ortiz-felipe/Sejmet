using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Customers.Create;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Queries.Customers.GetAll;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly IMediator _mediator;

        public CustomersController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("", Name = "GetAllAsync")]
        [ProducesResponseType(typeof(IList<CustomerDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllAsync([FromQuery] QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest).ConfigureAwait(false);
        }

        [HttpGet("{Dni}", Name = "GetCustomerByDniAsync")]
        [ProducesResponseType(typeof(CustomerInfoDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetCustomerByDniAsync([FromRoute] Queries.Customers.GetByDNI.QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest).ConfigureAwait(false);
        }

        [HttpPost(Name = "CreateCustomerAsync")]
        [ProducesResponseType(typeof(CustomerDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateCustomerAsync([FromBody] CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest).ConfigureAwait(false);
        }
    }
}
