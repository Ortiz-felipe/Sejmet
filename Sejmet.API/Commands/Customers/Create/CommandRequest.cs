using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Customers;

namespace Sejmet.API.Commands.Customers.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CustomerDTO Body { get; set; }
    }
}
