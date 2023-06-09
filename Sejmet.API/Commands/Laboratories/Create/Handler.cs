﻿using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Laboratory;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Laboratories.Create
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly ILaboratoriesRepository _laboratoriesRepository;

        public Handler(ILaboratoriesRepository laboratoriesRepository)
        {
            _laboratoriesRepository = laboratoriesRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var createdLaboratory = await _laboratoriesRepository.CreateLaboratoryAsync(request.Body, cancellationToken);
                return this.CreatedAtRoute("laboratories", createdLaboratory.Id, createdLaboratory);
            }
            catch (Exception)
            {
                return this.InternalServerError(LaboratoryErrors.CreateNewLaboratoryError);
            }
        }
    }
}
