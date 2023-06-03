using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;

        public ProductsRepository(SejmetDbContext context, IMapper mapper)
        {
            _dbContext = context;
            _mapper = mapper;
        }

        public async Task<CreateProductDTO> CreateProductAsync(CreateProductDTO productDTO, CancellationToken cancellationToken)
        {
            var product = _mapper.Map<Product>(productDTO);


            try
            {
                await _dbContext.AddAsync(product, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return _mapper.Map<CreateProductDTO>(product);
            }
            catch (Exception)
            {
                throw;
            }


        }

        public async Task<ProductDTO?> GetProductByUPCAsync(string productUPC, CancellationToken cancellationToken)
        {
            var product = await GetProductsQuery().FirstOrDefaultAsync(x => x.Upc == productUPC, cancellationToken);

            if (product is null)
            {
                return null;
            }

            return _mapper.Map<ProductDTO>(product);
        }

        public async Task<PagedResponseDTO<ProductDTO>> GetProductsAsync(string searchExpression, int currentPage, int pageSize, CancellationToken cancellationToken)
        {
            var query = GetProductsQuery();

            if (!string.IsNullOrWhiteSpace(searchExpression))
            {
                query = query.Where(x => x.TradeName.Contains(searchExpression) || x.ActiveCompound.Name.Contains(searchExpression));
            }

            var totalRecords = query.Count();
            var products = await query.Skip((pageSize * (currentPage - 1))).Take(pageSize).ToListAsync(cancellationToken);


            return new PagedResponseDTO<ProductDTO>()
            {
                Items = _mapper.Map<List<ProductDTO>>(products),
                PageSize = pageSize,
                CurrentPage = currentPage,
                TotalRecords = totalRecords,
                TotalPages = (int)Math.Ceiling((double)totalRecords / pageSize)
            };
        }


        public Task<CreateProductDTO> UpdateProductStockAsync(string productUPC, int quantity, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public async Task<IList<TopSoldProductDTO>> GetTopSoldProductsAsync(CancellationToken cancellationToken)
        {
            var products = GetProductsQuery();
            var sales = _dbContext.Sales.AsQueryable();

            var soldProducts = sales.SelectMany(sale => sale.SaleProducts);

            var productSales = soldProducts.GroupBy(sp => sp.ProductId)
                .Select(group => new
                {
                    ProductId = group.Key,
                    TotalQuantitySold = group.Sum(sp => sp.Quantity)
                });

            var topSellingProductIds = productSales.OrderByDescending(product => product.TotalQuantitySold)
                        .Take(5)
                        .Select(product => product.ProductId);

            var topSellingProducts = await topSellingProductIds.Join(products, productId => productId, product => product.Id,
                (productId, product) => new TopSoldProductDTO()
                {
                    Id = product.Id,
                    Upc = product.Upc,
                    LaboratoryName = product.Laboratory.Name,
                    TradeName = product.TradeName
                }).ToListAsync(cancellationToken);

            return topSellingProducts;
        }

        public async Task<IList<CriticalStockProductDTO>> GetTopProductsInCriticalStock(CancellationToken cancellationToken)
        {
            var criticalStockProducts = await _dbContext.Products.Where(x => x.CurrentStock < 5)
                            .OrderBy(x => x.CurrentStock)
                            .Take(5)
                            .ToListAsync(cancellationToken);

            return _mapper.Map<List<CriticalStockProductDTO>>(criticalStockProducts);
        }

        private IQueryable<Product> GetProductsQuery()
        {
            return _dbContext.Products.Include(x => x.ActiveCompound)
                                    .Include(x => x.Laboratory)
                                    .Include(x => x.ActiveCompound.TherapeuticEffect)
                                    .Include(x => x.DosageForm)
                                    .OrderBy(x => x.ActiveCompound.Name)
                                    .AsQueryable();
        }
    }
}
