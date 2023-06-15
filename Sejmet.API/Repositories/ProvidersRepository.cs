using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Providers;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class ProvidersRepository : IProvidersRepository
    {
        private readonly SejmetDbContext _context;
        private IMapper _mapper;

        public ProvidersRepository(SejmetDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IList<ProviderDTO>> GetAllProvidersAsync(CancellationToken cancellationToken)
        {
            var providers = await _context.Providers.ToListAsync(cancellationToken);

            return _mapper.Map<IList<ProviderDTO>>(providers);
        }
    }
}
