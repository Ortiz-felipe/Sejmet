using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.DTOs.Sales;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IProductsRepository
    {
        Task<PagedResponseDTO<ProductDTO>> GetProductsAsync(string searchExpression, int currentPage, int pageSize, CancellationToken cancellationToken);
        Task<ProductDTO?> GetProductByUPCAsync(string productUPC, CancellationToken cancellationToken);
        Task<CreateProductDTO> CreateProductAsync(CreateProductDTO productDTO, CancellationToken cancellationToken);
        Task<CreateProductDTO> UpdateProductStockAsync(string productUPC, int quantity, CancellationToken cancellationToken);
        Task<IList<TopSoldProductDTO>> GetTopSoldProductsAsync(CancellationToken cancellationToken);
        Task<IList<CriticalStockProductDTO>> GetTopProductsInCriticalStock(CancellationToken cancellationToken);
    }
}
