using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Products.GetTopSoldProducts
{
    public class QueryRequest : IRequest<IActionResult>
    {
    }
}
