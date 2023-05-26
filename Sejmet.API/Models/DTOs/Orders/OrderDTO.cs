using Sejmet.API.Models.DTOs.OrderProducts;

namespace Sejmet.API.Models.DTOs.Orders
{
    public class OrderDTO
    {
        public Guid Id { get; set; }
        public Guid ProviderId { get; set; }
        public string ProviderName { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime RecievedDate { get; set; }
        public int TransactionStatusId { get; set; }
        public IList<OrderProductDTO> OrderedProducts { get; set; }
    }
}
