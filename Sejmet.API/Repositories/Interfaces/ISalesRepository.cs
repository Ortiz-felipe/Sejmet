using Sejmet.API.Models.DTOs.Sales;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ISalesRepository
    {
        Task<IList<SaleDTO>> GetAllSalesAsync(string customerName, CancellationToken cancellationToken);
        Task<SaleDTO?> GetSaleByIdAsync(Guid saleId, CancellationToken cancellationToken);
        Task<CreateSaleDTO> CreateSaleAsync(CreateSaleDTO sale, CancellationToken cancellationToken);
    }
}
