using AutoMapper;
using Sejmet.API.Models.DTOs.OrderProducts;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateOrderProductProfile : Profile
    {
        public CreateOrderProductProfile()
        {
            this.CreateMap<OrderProduct, CreateOrderProductDTO>()
                .ForMember(destination => destination.OrderId, origin => origin.MapFrom(x => x.OrderId))
                .ForMember(destination => destination.ProductID, origin => origin.MapFrom(x => x.ProductId))
                .ForMember(destination => destination.Quantity, origin => origin.MapFrom(x => x.Quantity))
                .ForMember(destination => destination.UnitPrice, origin => origin.MapFrom(x => x.UnitPrice));

            this.CreateMap<CreateOrderProductDTO, OrderProduct>()
                .ForMember(destination => destination.OrderId, origin => origin.MapFrom(x => x.OrderId))
                .ForMember(destination => destination.ProductId, origin => origin.MapFrom(x => x.ProductID))
                .ForMember(destination => destination.Quantity, origin => origin.MapFrom(x => x.Quantity))
                .ForMember(destination => destination.UnitPrice, origin => origin.MapFrom(x => x.UnitPrice));
        }
    }
}
