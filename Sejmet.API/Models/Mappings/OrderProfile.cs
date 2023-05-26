using AutoMapper;
using Sejmet.API.Models.DTOs.Orders;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            this.CreateMap<Order, OrderDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.ProviderId, origin => origin.MapFrom(x => x.ProviderId))
                .ForMember(destination => destination.OrderDate, origin => origin.MapFrom(x => x.OrderDate))
                .ForMember(destination => destination.ProviderName, origin => origin.MapFrom(x => x.Provider.Name))
                .ForMember(destination => destination.TotalAmount, origin => origin.MapFrom(x => x.TotalAmount))
                .ForMember(destination => destination.OrderedProducts, origin => origin.MapFrom(x => x.OrderProducts))
                .ReverseMap();
        }
    }
}
