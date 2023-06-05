using AutoMapper;
using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CustomerInfoProfile : Profile
    {
        public CustomerInfoProfile()
        {
            this.CreateMap<Customer, CustomerInfoDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.CustomerName, origin => origin.MapFrom(x => $"{x.FirstName} {x.LastName}"))
                .ForMember(destination => destination.HealthcareProviderName, origin => origin.MapFrom(x => x.HealtcareProvider.Name));
        }
    }
}
