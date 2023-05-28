using Sejmet.API.Models.DTOs.Provinces;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IProvincesRepository
    {
        Task<IList<ProvinceDTO>> GetAllProvincesAsync(CancellationToken cancellationToken);
    }
}
