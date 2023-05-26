using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.HealthcareProvider;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.HealthcareProviders.Create
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
                var createdHealthcareProvider = await _healthcareProvidersRepository.CreateHealthcareProviderAsync(request.Body, cancellationToken);
                return this.CreatedAtRoute("healthcareProvider", createdHealthcareProvider.Id, createdHealthcareProvider);
            }
            catch (Exception)
            {
                return this.InternalServerError(HealthcareProviderErrors.CreateHealthcareProviderError);
            }
            
        }
    }
}
