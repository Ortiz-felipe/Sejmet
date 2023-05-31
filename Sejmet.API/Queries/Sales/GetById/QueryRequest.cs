using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Sales.GetById
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public Guid Id { get; set; }
    }
}
