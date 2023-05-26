using AutoMapper;
using Sejmet.API.Models.DTOs.SaleProducts;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class SaleProductProfile : Profile
    {
        public SaleProductProfile()
        {
            this.CreateMap<SaleProduct, SaleProductDTO>()
                .ForMember(destination => destination.ProductId, origin => origin.MapFrom(x => x.ProductId))
                .ForMember(destination => destination.ProductName, origin => origin.MapFrom(x => x.Product.TradeName))
                .ForMember(destination => destination.Quantity, origin => origin.MapFrom(x => x.Quantity))
                .ForMember(destination => destination.UnitPrice, origin => origin.MapFrom(x => x.UnitPrice))
                .ReverseMap();
        }
    }
}
