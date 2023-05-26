using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Sales;

namespace Sejmet.API.Commands.Sales.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CreateSaleDTO Body { get; set; }
    }
}
