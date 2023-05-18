using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Customers;

namespace Sejmet.API.Commands.Customers.Update
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public Guid CustomerId { get; set; }
        [FromBody]
        public UpdateCustomerDTO Body { get; set; }
    }
}
