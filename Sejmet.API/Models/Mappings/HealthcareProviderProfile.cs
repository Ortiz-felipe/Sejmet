using AutoMapper;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class HealthcareProviderProfile : Profile
    {
        public HealthcareProviderProfile()
        {
            this.CreateMap<HealthcareProviderDTO, HealthcareProvider>()
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name))
                .ForMember(destination => destination.IsActive, origin => origin.MapFrom(x => x.IsActive))
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ReverseMap();
        }
    }
}
