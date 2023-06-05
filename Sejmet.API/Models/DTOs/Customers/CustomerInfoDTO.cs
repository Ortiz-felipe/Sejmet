namespace Sejmet.API.Models.DTOs.Customers
{
    public class CustomerInfoDTO
    {
        public Guid Id { get; set; }
        public string CustomerName { get; set; }
        public string HealthcareProviderName { get; set; }
    }
}
