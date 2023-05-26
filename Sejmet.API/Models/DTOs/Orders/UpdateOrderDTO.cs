namespace Sejmet.API.Models.DTOs.Orders
{
    public class UpdateOrderDTO
    {
        public Guid OrderId { get; set; }
        public int TransactionStatusId { get; set; }
    }
}
