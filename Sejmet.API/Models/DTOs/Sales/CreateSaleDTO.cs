using Sejmet.API.Models.DTOs.SaleProducts;

namespace Sejmet.API.Models.DTOs.Sales
{
    public class CreateSaleDTO
    {
        public Guid SaleId { get; set; }
        public Guid CustomerID { get; set; }
        public DateTime SaleDate { get; set; }
        public decimal TotalAmount { get; set; }
        public IList<CreateSaleProductDTO> SoldProducts { get; set; }
    }
}
