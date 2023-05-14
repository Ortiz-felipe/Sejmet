using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.HealthcareProvider;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class HealthcareProvidersRepository : IHealthcareProvidersRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;

        public HealthcareProvidersRepository(SejmetDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<IList<HealthcareProviderDTO>> GetHealthcareProvidersAsync(bool isActive, CancellationToken cancellationToken)
        {
            var query = _dbContext.HealthcareProviders.AsQueryable();

            if (isActive)
            {
                query = query.Where(x => x.IsActive);
            }

            try
            {
                var providers = await query.ToListAsync(cancellationToken).ConfigureAwait(false);
                return _mapper.Map<List<HealthcareProviderDTO>>(providers);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<HealthcareProviderDTO> CreateHealthcareProviderAsync(HealthcareProviderDTO healthcareProviderDTO, CancellationToken cancellationToken)
        {
            var healthcareProvider = _mapper.Map<HealthcareProvider>(healthcareProviderDTO);

            await _dbContext.AddAsync(healthcareProvider, cancellationToken);
            await _dbContext.SaveChangesAsync(cancellationToken);

            return _mapper.Map<HealthcareProviderDTO>(healthcareProvider);
        }

        public async Task<HealthcareProviderDTO?> DisableHealthcareProviderAsync(Guid id, CancellationToken cancellationToken)
        {
            var healthcareProvider = await _dbContext.HealthcareProviders.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

            if (healthcareProvider is null)
            {
                return null;
            }

            healthcareProvider.IsActive = false;
            await _dbContext.SaveChangesAsync(cancellationToken);

            return _mapper.Map<HealthcareProviderDTO>(healthcareProvider);
        }
    }
}
