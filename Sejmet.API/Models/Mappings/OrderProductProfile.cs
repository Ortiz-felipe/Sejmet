using AutoMapper;
using Sejmet.API.Models.DTOs.OrderProducts;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class OrderProductProfile : Profile
    {
        public OrderProductProfile()
        {
            this.CreateMap<OrderProduct, OrderProductDTO>()
                .ForMember(destination => destination.ProductId, origin => origin.MapFrom(x => x.ProductId))
                .ForMember(destination => destination.ProductName, origin => origin.MapFrom(x => x.Product.TradeName))
                .ForMember(destination => destination.Quantity, origin => origin.MapFrom(x => x.Quantity))
                .ForMember(destination => destination.UnitPrice, origin => origin.MapFrom(x => x.UnitPrice))
                .ReverseMap();
        }
    }
}
