using AutoMapper;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CriticalStockProductProfile : Profile
    {
        public CriticalStockProductProfile()
        {
            this.CreateMap<Product, CriticalStockProductDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.Upc, origin => origin.MapFrom(x => x.Upc))
                .ForMember(destination => destination.ProductName, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.CurrentStock, origin => origin.MapFrom(x => x.CurrentStock));
        }
    }
}
