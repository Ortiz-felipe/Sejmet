
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Sales.GetSalesByMonth
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public int Year { get; set; }   
    }
}
