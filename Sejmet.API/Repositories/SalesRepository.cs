using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;
using System.Globalization;

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

        public async Task<PagedResponseDTO<SaleDTO>> GetAllSalesAsync(string customerName, int currentPage, int pageSize, CancellationToken cancellationToken)
        {
            var query = _context.Sales.Include(x => x.Customer)
                                                    .Include(x => x.SaleProducts)
                                                    .ThenInclude(x => x.Product)
                                                    .OrderByDescending(x => x.SaleDate)
                                                    .AsQueryable();

            if (!string.IsNullOrWhiteSpace(customerName))
            {
                query = query.Where(x =>
                    x.Customer.FirstName.Contains(customerName) || x.Customer.LastName.Contains(customerName));
            }

            var totalRecords = query.Count();
            var sales = await query.Skip((pageSize * (currentPage - 1))).Take(pageSize).ToListAsync(cancellationToken);
            

            return new PagedResponseDTO<SaleDTO>()
            {
                Items = _mapper.Map<List<SaleDTO>>(sales),
                PageSize = pageSize,
                CurrentPage = currentPage,
                TotalRecords = totalRecords,
                TotalPages = (int)Math.Ceiling((double)totalRecords / pageSize)
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

            var saleProductsList = newSale.SaleProducts.ToList();
            // Deduct sold items from the current stock
            foreach (var saleProduct in saleProductsList)
            {
                var product1 = saleProduct;
                var product = await _context.Products.FirstOrDefaultAsync(x => x.Id == product1.ProductId, cancellationToken);

                if (product is not null)
                {
                    // Deduct the sold quantity from the current stock
                    product.CurrentStock -= saleProduct.Quantity;
                }
            }


            await _context.Sales.AddAsync(newSale, cancellationToken);
            await _context.SaveChangesAsync(cancellationToken);

            return _mapper.Map<CreateSaleDTO>(newSale);
        }

        public async Task<IList<SalesByMonthDTO>> GetSalesByMonthAsync(int year, CancellationToken cancellationToken)
        {
            var salesByMonth = await _context.Sales
                .Where(sale => sale.SaleDate.Year == year)
                .GroupBy(sale => sale.SaleDate.Month)
                .OrderBy(group => group.Key)
                .Select(group => new SalesByMonthDTO() {
                    Month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(group.Key),
                    TotalAmount = group.Sum(sale => sale.TotalAmount)
                })
                .ToListAsync(cancellationToken);

            return salesByMonth;
        }
    }
}
