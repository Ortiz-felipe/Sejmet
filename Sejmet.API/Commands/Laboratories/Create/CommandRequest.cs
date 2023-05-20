using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.Laboratories;

namespace Sejmet.API.Commands.Laboratories.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public CreateLaboratoryDTO Body { get; set; }
    }
}
