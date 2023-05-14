using AutoMapper;
using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class UpdateCustomerProfile : Profile
    {
        public UpdateCustomerProfile() 
        {
            this.CreateMap<UpdateCustomerDTO, Customer>()
                .ForMember(dest => dest.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(dest => dest.FirstName, origin => origin.MapFrom(x => x.FirstName))
                .ForMember(dest => dest.LastName, origin => origin.MapFrom(x => x.LastName))
                .ForMember(dest => dest.Address, origin => origin.MapFrom(x => x.Address))
                .ForMember(dest => dest.CityId, origin => origin.MapFrom(x => x.CityId))
                .ForMember(dest => dest.ProvinceId, origin => origin.MapFrom(x => x.ProvinceId))
                .ForMember(dest => dest.PhoneNumber, origin => origin.MapFrom(x => x.PhoneNumber))
                .ForMember(dest => dest.HealtcareProviderId, origin => origin.MapFrom(x => x.HealthCareProviderId));
        }
    }
}
