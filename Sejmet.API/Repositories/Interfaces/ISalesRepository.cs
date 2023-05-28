using Sejmet.API.Models.DTOs.Sales;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ISalesRepository
    {
        Task<GetSalesDTO> GetAllSalesAsync(string customerName, int skip, int take, CancellationToken cancellationToken);
        Task<SaleDTO?> GetSaleByIdAsync(Guid saleId, CancellationToken cancellationToken);
        Task<CreateSaleDTO> CreateSaleAsync(CreateSaleDTO sale, CancellationToken cancellationToken);
    }
}
