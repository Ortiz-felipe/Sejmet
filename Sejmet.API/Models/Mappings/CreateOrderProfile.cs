using AutoMapper;
using Sejmet.API.Models.DTOs.Orders;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateOrderProfile : Profile
    {
        public CreateOrderProfile()
        {
            this.CreateMap<Order, CreateOrderDTO>()
                .ForMember(destination => destination.OrderId, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.ProviderId, origin => origin.MapFrom(x => x.ProviderId))
                .ForMember(destination => destination.OrderDate, origin => origin.MapFrom(x => x.OrderDate))
                .ForMember(destination => destination.TransactionStatusId,
                    origin => origin.MapFrom(x => x.TransactionStatusId))
                .ForMember(destination => destination.OrderedProducts, origin => origin.MapFrom(x => x.OrderProducts))
                .ReverseMap();

        }
    }
}
