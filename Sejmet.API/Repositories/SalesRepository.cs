using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class SalesRepository : ISalesRepository
    {
        private readonly SejmetDbContext _context;
        private readonly IMapper _mapper;

        public SalesRepository(SejmetDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IList<SaleDTO>> GetAllSalesAsync(string customerName, CancellationToken cancellationToken)
        {
            var query = _context.Sales.Include(x => x.Customer)
                                                    .Include(x => x.SaleProducts)
                                                    .ThenInclude(x => x.Product)
                                                    .AsQueryable();

            if (!string.IsNullOrWhiteSpace(customerName))
            {
                query = query.Where(x =>
                    x.Customer.FirstName.Contains(customerName) || x.Customer.LastName.Contains(customerName));
            }

            var sales = await query.ToListAsync(cancellationToken);

            return _mapper.Map<List<SaleDTO>>(sales);
        }

        public async Task<SaleDTO?> GetSaleByIdAsync(Guid saleId, CancellationToken cancellationToken)
        {
            var sale = await _context.Sales.Include(x => x.Customer)
                                            .Include(x => x.SaleProducts)
                                            .ThenInclude(x => x.Product)
                                            .FirstOrDefaultAsync(x => x.Id == saleId, cancellationToken);

            return sale is null ? null : _mapper.Map<SaleDTO>(sale);
            
        }

        public async Task<CreateSaleDTO> CreateSaleAsync(CreateSaleDTO sale, CancellationToken cancellationToken)
        {
            var newSale = _mapper.Map<Sale>(sale);

            await _context.Sales.AddAsync(newSale, cancellationToken);
            await _context.SaveChangesAsync(cancellationToken);

            return _mapper.Map<CreateSaleDTO>(newSale);
        }
    }
}
