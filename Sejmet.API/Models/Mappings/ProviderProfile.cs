using AutoMapper;
using Sejmet.API.Models.DTOs.Providers;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class ProviderProfile : Profile
    {
        public ProviderProfile()
        {
            this.CreateMap<Provider, ProviderDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.ProviderName, origin => origin.MapFrom(x => x.Name));
        }
    }
}
