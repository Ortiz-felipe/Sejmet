using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Orders;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IOrdersRepository
    {
        Task<PagedResponseDTO<OrderDTO>> GetAllOrdersAsync(string providerName, int currentPage, int pageSize, CancellationToken cancellationToken);
        Task<OrderDTO?> GetOrderByIdAsync(Guid orderId, CancellationToken cancellationToken);
        Task<CreateOrderDTO> CreateOrderAsync(CreateOrderDTO orderDTO, CancellationToken cancellationToken);
        Task<OrderDTO?> UpdateOrderAsync(UpdateOrderDTO orderDTO, CancellationToken cancellationToken);
    }
}
