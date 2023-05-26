using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Sales.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        public string CustomerName { get; set; }
    }
}
