using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Provinces;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Provinces.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly IProvincesRepository _provincesRepository;

        public Handler(IProvincesRepository provincesRepository)
        {
            _provincesRepository = provincesRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var provinces = await _provincesRepository.GetAllProvincesAsync(cancellationToken);
                return this.Ok(provinces);
            }
            catch (Exception)
            {
                return this.InternalServerError(ProvincesErrors.GetAllProvincesError);
            }
        }
    }
}
