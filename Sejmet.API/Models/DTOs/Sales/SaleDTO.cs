using Sejmet.API.Models.DTOs.SaleProducts;

namespace Sejmet.API.Models.DTOs.Sales
{
    public class SaleDTO
    {
        public Guid SaleId { get; set; }
        public Guid CustomerId { get; set; }
        public string CustomerName { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime SaleDate { get; set; }
        public IList<SaleProductDTO> SoldProducts { get; set; }
    }
}
