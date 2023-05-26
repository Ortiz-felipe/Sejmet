using Sejmet.API.Models.DTOs.Orders;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface IOrdersRepository
    {
        Task<IList<OrderDTO>> GetAllOrdersAsync(string providerName, CancellationToken cancellationToken);
        Task<OrderDTO?> GetOrderByIdAsync(Guid orderId, CancellationToken cancellationToken);
        Task<CreateOrderDTO> CreateOrderAsync(CreateOrderDTO orderDTO, CancellationToken cancellationToken);
        Task<OrderDTO?> UpdateOrderAsync(UpdateOrderDTO orderDTO, CancellationToken cancellationToken);
    }
}
