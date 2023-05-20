using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Laboratories;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class LaboratoriesRepository : ILaboratoriesRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;

        public LaboratoriesRepository(SejmetDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<CreateLaboratoryDTO> CreateLaboratoryAsync(CreateLaboratoryDTO createLaboratoryDTO, CancellationToken cancellationToken)
        {
            var laboratory = _mapper.Map<Laboratory>(createLaboratoryDTO);

            try
            {
                await _dbContext.AddAsync(laboratory, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return _mapper.Map<CreateLaboratoryDTO>(laboratory);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<IList<LaboratoryDTO>> GetAllLaboratoriesAsync(string searchExpression, CancellationToken cancellationToken)
        {
            var query = _dbContext.Laboratories.AsQueryable();

            if (!string.IsNullOrWhiteSpace(searchExpression))
            {
                query = query.Where(x => x.Name.Contains(searchExpression));
            }

            try
            {
                var laboratories = query.ToListAsync(cancellationToken);

                return _mapper.Map<List<LaboratoryDTO>>(laboratories);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
