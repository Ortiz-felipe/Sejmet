using AutoMapper;
using Sejmet.API.Models.DTOs.Laboratories;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateLaboratoryProfile : Profile
    {
        public CreateLaboratoryProfile()
        {
            this.CreateMap<CreateLaboratoryDTO, Laboratory>()
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name));

            this.CreateMap<Laboratory, CreateLaboratoryDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.Name, origin => origin.MapFrom(x => x.Name));
        }
    }
}
