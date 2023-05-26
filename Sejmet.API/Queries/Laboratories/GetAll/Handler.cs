using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Laboratory;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Laboratories.GetAll
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly ILaboratoriesRepository _laboratoriesRepository;

        public Handler(ILaboratoriesRepository laboratoriesRepository)
        {
            _laboratoriesRepository = laboratoriesRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var laboratories = await _laboratoriesRepository.GetAllLaboratoriesAsync(request.LaboratoryName, cancellationToken);

                return this.Ok(laboratories);
            }
            catch (Exception)
            {
                return this.InternalServerError(LaboratoryErrors.GetAllLaboratoriesError);
            }
        }
    }
}
