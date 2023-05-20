using AutoMapper;
using Sejmet.API.Models.DTOs.Laboratories;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class LaboratoryProfile : Profile
    {
        public LaboratoryProfile()
        {
            this.CreateMap<Laboratory, LaboratoryDTO>()
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name));
        }
    }
}
