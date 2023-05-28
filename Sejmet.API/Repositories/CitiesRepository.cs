using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Cities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class CitiesRepository : ICitiesRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;
        
        public CitiesRepository(SejmetDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<IList<CityDTO>> GetAllCitiesAsync(int provinceId, CancellationToken cancellationToken)
        {
            var cities = await _dbContext.Cities.Where(x => x.ProvinceId == provinceId).ToListAsync(cancellationToken);

            return _mapper.Map<IList<CityDTO>>(cities);
        }
    }
}
