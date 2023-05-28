using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Cities;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Cities.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly ICitiesRepository _citiesRepository;

        public Handler(ICitiesRepository citiesRepository)
        {
            _citiesRepository = citiesRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var cities = await _citiesRepository.GetAllCitiesAsync(request.ProvinceId, cancellationToken);

                return this.Ok(cities);
            }
            catch (Exception)
            {
                return this.InternalServerError(CitiesErrors.GetAllCitiesError);
            }
        }
    }
}
