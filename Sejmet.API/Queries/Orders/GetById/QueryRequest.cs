using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Orders.GetById
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public Guid OrderId { get; set; }
    }
}
