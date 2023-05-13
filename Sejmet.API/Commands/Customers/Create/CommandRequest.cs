using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs;

namespace Sejmet.API.Commands.Customers.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CreateProductDTO Body { get; set; }
    }
}
