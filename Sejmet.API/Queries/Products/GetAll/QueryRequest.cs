using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Products.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public string? SearchExpression { get; set; }
    }
}
