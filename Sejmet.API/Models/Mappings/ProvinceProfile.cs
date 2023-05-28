using AutoMapper;
using Sejmet.API.Models.DTOs.Provinces;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class ProvinceProfile : Profile
    {
        public ProvinceProfile()
        {
            this.CreateMap<Province, ProvinceDTO>()
                .ForMember(destination => destination.ID, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name))
                .ReverseMap();
        }
    }
}
