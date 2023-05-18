using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Products.GetByProductCode
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public string ProductCode { get; set; }
    }
}
