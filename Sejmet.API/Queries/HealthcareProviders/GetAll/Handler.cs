using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.HealthcareProvider;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.HealthcareProviders.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly IHealthcareProvidersRepository _healthcareProvidersRepository;

        public Handler(IHealthcareProvidersRepository healthcareProvidersRepository)
        {
            _healthcareProvidersRepository = healthcareProvidersRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var providers = await _healthcareProvidersRepository.GetHealthcareProvidersAsync(request.IncludeDeactivedProviders.GetValueOrDefault(), cancellationToken);
                return this.Ok(providers);
            }
            catch (Exception)
            {
                return this.InternalServerError(HealthcareProviderErrors.GetAllHealthcareProvidersError);
            }
            
        }
    }
}
