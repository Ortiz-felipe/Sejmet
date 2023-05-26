namespace Sejmet.API.Models.DTOs.Sales
{
    public class UpdateSaleDTO
    {
        public Guid SaleId { get; set; }
        public int TransactionStatusId { get; set; }
    }
}
