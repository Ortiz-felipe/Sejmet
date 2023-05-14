namespace Sejmet.API.Models.DTOs.Customers
{
    public class CustomerDTO
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public DateTime Birthdate { get; set; }
        public int Age { get; set; }
        public Guid HealthCareProviderId { get; set; }
        public Guid CityId { get; set; }
        public int ProvinceId { get; set; }
        public string PhoneNumber { get; set; } = string.Empty;

    }
}
