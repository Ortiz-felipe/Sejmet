namespace Sejmet.API.Models.DTOs.Products
{
    public class CriticalStockProductDTO
    {
        public Guid Id { get; set; }
        public string Upc { get; set; }
        public string ProductName { get; set; }
        public int CurrentStock { get; set; }
    }
}
