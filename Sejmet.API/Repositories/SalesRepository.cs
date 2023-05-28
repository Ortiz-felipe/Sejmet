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

        public async Task<GetSalesDTO> GetAllSalesAsync(string customerName, int skip, int take, CancellationToken cancellationToken)
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

            var totalRecords = query.Count();
            var sales = await query.Skip(skip).Take(take).ToListAsync(cancellationToken);
            

            return new GetSalesDTO()
            {
                Sales = _mapper.Map<List<SaleDTO>>(sales),
                Skip = skip,
                Take = take,
                TotalRecords = totalRecords     
            };
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
