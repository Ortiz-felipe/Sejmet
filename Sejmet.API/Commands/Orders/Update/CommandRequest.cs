using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Orders;

namespace Sejmet.API.Commands.Orders.Update
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public UpdateOrderDTO Body { get; set; }
    }
}
