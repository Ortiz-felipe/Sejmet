namespace Sejmet.API.Models.DTOs.Customers
{
    public class UpdateCustomerDTO
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public Guid HealthCareProviderId { get; set; }
        public Guid CityId { get; set; }
        public int ProvinceId { get; set; }
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
