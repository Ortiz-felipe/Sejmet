using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Orders.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery] 
        public string? ProviderName { get; set; }
        [FromQuery] 
        public int CurrentPage { get; set; }
        [FromQuery] 
        public int PageSize { get; set; }

    }
}
