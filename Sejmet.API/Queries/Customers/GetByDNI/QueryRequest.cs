using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Customers.GetByDNI
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public string Dni { get; set; }
    }
}
