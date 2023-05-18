using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.HealthcareProviders.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public bool? IncludeDeactivedProviders { get; set; }
    }
}
