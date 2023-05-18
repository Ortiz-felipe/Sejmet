namespace Sejmet.API.Models.DTOs.Products
{
    public class ProductDTO
    {
        public string Upc { get; set; }
        public string TradeName { get; set; }
        public string LaboratoryName { get; set; }
        public string DosageFormName { get; set; }
        public string ActiveCompoundName { get; set; }
        public int Container { get; set; }
        public int Dosage { get; set; }
        public decimal Price { get; set; }
        public int CurrentStock { get; set; }
    }
}
