using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Sales.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public string? CustomerName { get; set; }

        [FromQuery]
        public int CurrentPage { get; set; }
        [FromQuery]
        public int PageSize { get; set; }

    }
}
