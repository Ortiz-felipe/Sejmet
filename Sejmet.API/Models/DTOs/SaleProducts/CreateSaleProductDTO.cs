namespace Sejmet.API.Models.DTOs.SaleProducts
{
    public class CreateSaleProductDTO
    {
        public Guid SaleID { get; set; }
        public Guid ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
