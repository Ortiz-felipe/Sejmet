using AutoMapper;
using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile() 
        {
            this.CreateMap<Customer, CustomerDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.FirstName, origin => origin.MapFrom(x => x.FirstName))
                .ForMember(destination => destination.LastName, origin => origin.MapFrom(x => x.LastName))
                .ForMember(destination => destination.Birthdate, origin => origin.MapFrom(x => x.Birthdate))
                .ForMember(destination => destination.Age, origin => origin.MapFrom(x => x.Age))
                .ForMember(destination => destination.HealthCareProviderId, origin => origin.MapFrom(x => x.HealtcareProviderId))
                .ForMember(destination => destination.PhoneNumber, origin => origin.MapFrom(x => x.PhoneNumber))
                .ForMember(destination => destination.CityId, origin => origin.MapFrom(x => x.CityId))
                .ForMember(destination => destination.ProvinceId, origin => origin.MapFrom(x => x.ProvinceId));
        }
    }
}
