using MediatR;
using Microsoft.AspNetCore.Mvc;
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
                return new CreatedAtRouteResult(createdHealthcareProvider.Id, new { createdHealthcareProvider.Id, Name = createdHealthcareProvider.Name, IsActive = createdHealthcareProvider.IsActive});
            }
            catch (Exception e)
            {
                return new ObjectResult(new ProblemDetails() { Detail = e.Message }) { StatusCode = 500 };
            }
            
        }
    }
}
