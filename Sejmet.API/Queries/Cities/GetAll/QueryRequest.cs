using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Cities.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery] 
        public int ProvinceId { get; set; }
    }
}
