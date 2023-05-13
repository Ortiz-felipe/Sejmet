using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Commands.Customers.Delete
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public Guid CustomerId { get; set; }
    }
}
