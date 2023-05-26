namespace Sejmet.API.Models.DTOs.OrderProducts
{
    public class CreateOrderProductDTO
    {
        public Guid OrderId { get; set; }
        public Guid ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
