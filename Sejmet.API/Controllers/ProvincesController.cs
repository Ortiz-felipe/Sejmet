using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors;
using Sejmet.API.Models.DTOs.Provinces;
using Sejmet.API.Queries.Provinces.GetAll;

namespace Sejmet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProvincesController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ProvincesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IList<ProvinceDTO>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ExtendedProblemDetails), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllProvincesAsync([FromQuery] QueryRequest queryRequest)
        {
            return await _mediator.Send(queryRequest);
        }
        
    }
}
