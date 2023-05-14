using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Products;

namespace Sejmet.API.Commands.Products.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CreateProductDTO Body { get; set; }
    }
}
