using AutoMapper;
using Sejmet.API.Models.DTOs.Cities;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CityProfile : Profile
    {
        public CityProfile()
        {
            this.CreateMap<City, CityDTO>()
                .ForMember(destination => destination.ID, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name))
                .ReverseMap();
        }
    }
}
