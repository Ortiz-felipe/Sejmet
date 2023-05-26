using AutoMapper;
using Sejmet.API.Models.DTOs.SaleProducts;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateOrderSaleProfile : Profile
    {
        public CreateOrderSaleProfile()
        {
            this.CreateMap<SaleProduct, CreateSaleProductDTO>()
                .ForMember(destination => destination.ProductID, origin => origin.MapFrom(x => x.ProductId))
                .ForMember(destination => destination.SaleID, origin => origin.MapFrom(x => x.SaleId))
                .ForMember(destination => destination.UnitPrice, origin => origin.MapFrom(x => x.UnitPrice))
                .ForMember(destination => destination.Quantity, origin => origin.MapFrom(x => x.Quantity))
                .ReverseMap();
        }
    }
}
