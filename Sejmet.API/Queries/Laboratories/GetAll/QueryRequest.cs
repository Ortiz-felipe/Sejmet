using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Laboratories.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public string LaboratoryName { get; set; }
    }
}
