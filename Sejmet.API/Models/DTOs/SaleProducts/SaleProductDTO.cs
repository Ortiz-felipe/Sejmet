namespace Sejmet.API.Models.DTOs.SaleProducts
{
    public class SaleProductDTO
    {
        public Guid ProductId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
