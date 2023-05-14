using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Queries.Customers.GetAll;
using System;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthcareProviderController : ControllerBase
    {
        private readonly IMediator _mediator;

        public HealthcareProviderController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(List<HealthcareProviderDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllHealthcareProvidersAsync(QueryRequest request)
        {
            return await _mediator.Send(request).ConfigureAwait(false);
        }

        [HttpPost]
        [ProducesResponseType(typeof(HealthcareProviderDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateHealthcareProviderAsync([FromBody] Commands.HealthcareProviders.Create.CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest).ConfigureAwait(false);
        }

        [HttpPatch]
        [Route("/{providerId}")]
        [ProducesResponseType(typeof(HealthcareProviderDTO), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DisableHealthcareProvider([FromRoute] Commands.HealthcareProviders.Patch.CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest).ConfigureAwait(false);
        }
    }
}
