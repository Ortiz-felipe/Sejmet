using AutoMapper;
using Sejmet.API.Models.DTOs.Orders;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class LatestOrderProfile : Profile
    {
        public LatestOrderProfile()
        {
            this.CreateMap<Order, LatestOrderDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.ProviderName, origin => origin.MapFrom(x => x.Provider.Name))
                .ForMember(destination => destination.OrderDate, origin => origin.MapFrom(x => x.OrderDate))
                .ForMember(destination => destination.TotalAmount, origin => origin.MapFrom(x => x.TotalAmount));
        }
    }
}
