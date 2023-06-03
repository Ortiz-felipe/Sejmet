namespace Sejmet.API.Models.DTOs.Orders
{
    public class LatestOrderDTO
    {
        public Guid Id { get; set; }
        public string ProviderName { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime OrderDate { get; set; }
    }
}
