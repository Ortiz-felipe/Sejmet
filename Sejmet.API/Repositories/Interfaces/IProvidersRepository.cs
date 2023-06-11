using Sejmet.API.Models.DTOs.Providers;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IProvidersRepository
    {
        Task<IList<ProviderDTO>> GetAllProvidersAsync(CancellationToken cancellationToken);
    }
}
