using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.HealthcareProvider;
using Sejmet.API.Extensions;
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

                return healthcareProvider is null ? this.NotFound(HealthcareProviderErrors.HealthcareProviderNotFound) : this.Ok(healthcareProvider);
            }
            catch (Exception)
            {
                return this.InternalServerError(HealthcareProviderErrors.PatchHealthcareProviderError);
            }
        }
    }
}
