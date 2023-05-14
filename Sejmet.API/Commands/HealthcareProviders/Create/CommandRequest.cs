using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Models.DTOs.HealthcareProvider;

namespace Sejmet.API.Commands.HealthcareProviders.Create
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromBody]
        public HealthcareProviderDTO Body { get; set; }
    }
}
