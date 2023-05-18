using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.HealthcareProviders.Patch
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly IHealthcareProvidersRepository _healthcareProvidersRepository;

        public Handler(IHealthcareProvidersRepository healthcareProvidersRepository)
        {
            _healthcareProvidersRepository = healthcareProvidersRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var healthcareProvider = await _healthcareProvidersRepository.DisableHealthcareProviderAsync(request.ProviderID, cancellationToken);

                if (healthcareProvider is null)
                {
                    return new NotFoundResult();
                }

                return new OkObjectResult(healthcareProvider);
            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
        }
    }
}
