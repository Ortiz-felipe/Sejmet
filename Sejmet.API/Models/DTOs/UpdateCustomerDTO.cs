namespace Sejmet.API.Models.DTOs
{
    public class UpdateCustomerDTO
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; } = String.Empty;
        public string LastName { get; set; } = String.Empty;
        public string Address { get; set; } = String.Empty;
        public Guid HealthCareProviderId { get; set; }
        public Guid CityId { get; set; }
        public int ProvinceId { get; set; }
        public string PhoneNumber { get; set; } = String.Empty;
    }
}
