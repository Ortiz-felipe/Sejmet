using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Commands.Laboratories.Create;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs.Laboratories;
using Sejmet.API.Queries.Laboratories.GetAll;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LaboratoriesController : ControllerBase
    {
        private readonly IMediator _mediator;

        public LaboratoriesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IList<LaboratoryDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllLaboratoriesAsync([FromQuery]QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }

        [HttpPost]
        [ProducesResponseType(typeof(CreateLaboratoryDTO), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateLaboratoryAsync(CommandRequest commandRequest)
        {
            return await _mediator.Send(commandRequest);
        }
    }
}
