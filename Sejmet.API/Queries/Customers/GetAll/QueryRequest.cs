using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Queries.Customers.GetAll
{
    public class QueryRequest : IRequest<IActionResult>
    {
        [FromQuery]
        public string? Name { get; set; }
        [FromQuery]
        public int? ProvinceID { get; set; }
        [FromQuery]
        public Guid? CityID { get; set; }
    }
}
