using Sejmet.API.Models.DTOs.HealthcareProvider;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IHealthcareProvidersRepository
    {
        Task<IList<HealthcareProviderDTO>> GetHealthcareProvidersAsync(bool isActive, CancellationToken cancellationToken);
        Task<HealthcareProviderDTO> CreateHealthcareProviderAsync(HealthcareProviderDTO healthcareProviderDTO, CancellationToken cancellationToken);
        Task<HealthcareProviderDTO?> DisableHealthcareProviderAsync(Guid id, CancellationToken cancellationToken);
    }
}
