using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Sejmet.API.Commands.HealthcareProviders.Patch
{
    public class CommandRequest : IRequest<IActionResult>
    {
        [FromRoute]
        public Guid ProviderID { get; set; }
    }
}
