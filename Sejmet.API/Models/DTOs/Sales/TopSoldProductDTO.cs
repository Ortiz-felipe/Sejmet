namespace Sejmet.API.Models.DTOs.Sales
{
    public class TopSoldProductDTO
    {
        public Guid Id { get; set; }
        public string Upc { get; set; }
        public string TradeName { get; set; }
        public string LaboratoryName { get; set; }
    }
}
