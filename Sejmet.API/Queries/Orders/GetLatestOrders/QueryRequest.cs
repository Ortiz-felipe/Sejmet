using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Orders.GetLatestOrders
{
    public class QueryRequest : IRequest<IActionResult>
    {
    }
}
