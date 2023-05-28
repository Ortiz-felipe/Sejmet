using Sejmet.API.Models.DTOs.Cities;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ICitiesRepository
    {
        Task<IList<CityDTO>> GetAllCitiesAsync(int provinceId, CancellationToken cancellationToken);
    }
}
