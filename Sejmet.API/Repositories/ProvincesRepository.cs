using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Provinces;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class ProvincesRepository : IProvincesRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;

        public ProvincesRepository(SejmetDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<IList<ProvinceDTO>> GetAllProvincesAsync(CancellationToken cancellationToken)
        {
            var provinces = await _dbContext.Provinces.ToListAsync(cancellationToken);

            return _mapper.Map<IList<ProvinceDTO>>(provinces);
        }
    }
}
