﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        private readonly SejmetDbContext _context;
        private readonly IMapper _mapper;

        public ProductsRepository(SejmetDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<CreateProductDTO> CreateProductAsync(CreateProductDTO productDTO, CancellationToken cancellationToken)
        {
            var product = _mapper.Map<Product>(productDTO);


            try
            {
                await _context.AddAsync(product, cancellationToken);
                await _context.SaveChangesAsync(cancellationToken);

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

        public async Task<IList<ProductDTO>> GetProductsAsync(string searchExpression, CancellationToken cancellationToken)
        {
            var query = GetProductsQuery();

            if (!string.IsNullOrWhiteSpace(searchExpression))
            {
                query = query.Where(x => x.TradeName.Contains(searchExpression) || x.ActiveCompound.Name.Contains(searchExpression));
            }

            var products = await query.ToListAsync(cancellationToken);


            return _mapper.Map<List<ProductDTO>>(products);
        }


        public Task<CreateProductDTO> UpdateProductStockAsync(string productUPC, int quantity, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        private IQueryable<Product> GetProductsQuery()
        {
            return _context.Products.Include(x => x.ActiveCompound)
                                    .Include(x => x.Laboratory)
                                    .Include(x => x.ActiveCompound.TherapeuticEffect)
                                    .Include(x => x.DosageForm)
                                    .AsQueryable();
        }
    }
}