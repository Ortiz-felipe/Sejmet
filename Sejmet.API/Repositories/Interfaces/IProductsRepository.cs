using Sejmet.API.Models.DTOs.Products;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IProductsRepository
    {
        Task<IList<ProductDTO>> GetProductsAsync(string searchExpression, CancellationToken cancellationToken);
        Task<ProductDTO?> GetProductByUPCAsync(string productUPC, CancellationToken cancellationToken);
        Task<CreateProductDTO> CreateProductAsync(CreateProductDTO productDTO, CancellationToken cancellationToken);
        Task<CreateProductDTO> UpdateProductStockAsync(string productUPC, int quantity, CancellationToken cancellationToken);
    }
}
