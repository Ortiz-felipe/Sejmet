using AutoMapper;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateSaleProfile : Profile
    {
        public CreateSaleProfile()
        {
            this.CreateMap<Sale, CreateSaleDTO>()
                .ForMember(destination => destination.SaleId, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.CustomerID, origin => origin.MapFrom(x => x.CustomerId))
                .ForMember(destination => destination.SaleDate, origin => origin.MapFrom(x => x.SaleDate))
                .ForMember(destination => destination.TotalAmount, origin => origin.MapFrom(x => x.TotalAmount))
                .ForMember(destination => destination.SoldProducts, origin => origin.MapFrom(x => x.SaleProducts))
                .ReverseMap();
        }
    }
}
