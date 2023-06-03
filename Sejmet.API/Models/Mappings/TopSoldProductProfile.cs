using AutoMapper;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class TopSoldProductProfile : Profile
    {
        public TopSoldProductProfile()
        {
            this.CreateMap<Product, TopSoldProductDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.TradeName, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.LaboratoryName, origin => origin.MapFrom(x => x.Laboratory.Name));
        }
    }
}
