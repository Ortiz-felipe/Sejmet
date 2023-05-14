namespace Sejmet.API.Models.DTOs.HealthcareProvider
{
    public class HealthcareProviderDTO
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
    }
}
