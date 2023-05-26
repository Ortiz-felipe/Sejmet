using Sejmet.API.Models.DTOs.OrderProducts;

namespace Sejmet.API.Models.DTOs.Orders
{
    public class CreateOrderDTO
    {
        public Guid OrderId { get; set; }
        public Guid ProviderId { get; set; }
        public Decimal TotalAmount { get; set; }
        public DateTime OrderDate { get; set; }
        public int TransactionStatusId { get; set; }
        public IList<CreateOrderProductDTO> OrderedProducts { get; set; }
    }
}
