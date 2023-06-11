using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Provider;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Providers.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly IProvidersRepository _providersRepository;

        public Handler(IProvidersRepository providersRepository)
        {
            _providersRepository = providersRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var providers = await _providersRepository.GetAllProvidersAsync(cancellationToken);

                return this.Ok(providers);
            }
            catch (Exception)
            {
                return this.InternalServerError(ProviderErrors.GetAllProvidersError);
            }
        }
    }
}
