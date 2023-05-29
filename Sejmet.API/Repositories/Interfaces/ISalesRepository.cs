using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Sales;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ISalesRepository
    {
        Task<PagedResponseDTO<SaleDTO>> GetAllSalesAsync(string customerName, int currentPage, int pageSize, CancellationToken cancellationToken);
        Task<SaleDTO?> GetSaleByIdAsync(Guid saleId, CancellationToken cancellationToken);
        Task<CreateSaleDTO> CreateSaleAsync(CreateSaleDTO sale, CancellationToken cancellationToken);
        Task<IList<SalesByMonthDTO>> GetSalesByMonthAsync(int year, CancellationToken cancellationToken);
    }
}
