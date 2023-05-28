using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Provinces.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
    }
}
