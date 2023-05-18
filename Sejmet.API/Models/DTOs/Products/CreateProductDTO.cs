namespace Sejmet.API.Models.DTOs.Products
{
    public class CreateProductDTO
    {
        public Guid Id { get; set; }
        public string TradeName { get; set; }
        public string Upc { get; set; }
        public Guid LaboratoryId { get; set; }
        public string LaboratoryName { get; set; }
        public Guid ActiveCompoundId { get; set; }
        public string ActiveCompoundName { get; set; }
        public int DosageFormId { get; set; }
        public string DosageFormName { get; set; }
        public decimal Price { get; set; }
        public int Container { get; set; }
        public int Dosage { get; set; }
        public int CurrentStock { get; set; }
        public int MaxDosage { get; set; }
        public int TherapeuticEffectId { get; set; }
        public string TherapeuticEffectName { get; set; }
    }
}
