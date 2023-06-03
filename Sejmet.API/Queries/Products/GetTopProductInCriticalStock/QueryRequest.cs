using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Products.GetTopProductInCriticalStock
{
    public class QueryRequest : IRequest<IActionResult>
    {
    }
}
