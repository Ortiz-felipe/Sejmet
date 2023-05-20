using Sejmet.API.Models.DTOs.Laboratories;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ILaboratoriesRepository
    {
        Task<IList<LaboratoryDTO>> GetAllLaboratoriesAsync(string searchExpression, CancellationToken cancellationToken);
        Task<CreateLaboratoryDTO> CreateLaboratoryAsync(CreateLaboratoryDTO createLaboratoryDTO, CancellationToken cancellationToken);
    }
}
