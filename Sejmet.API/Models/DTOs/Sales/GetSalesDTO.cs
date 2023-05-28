namespace Sejmet.API.Models.DTOs.Sales
{
    public class GetSalesDTO
    {
        public IList<SaleDTO> Sales { get; set; }
        public int Skip { get; set; }
        public int Take { get; set; }
        public int TotalRecords { get; set; }
    }
}
