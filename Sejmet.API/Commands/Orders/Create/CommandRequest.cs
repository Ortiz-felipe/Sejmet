using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Orders;

namespace Sejmet.API.Commands.Orders.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CreateOrderDTO Body { get; set; }
    }
}
