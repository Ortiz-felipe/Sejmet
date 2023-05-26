using AutoMapper;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class SaleProfile : Profile
    {
        public SaleProfile()
        {
            this.CreateMap<Sale, SaleDTO>()
                .ForMember(destination => destination.SaleId, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.CustomerId, origin => origin.MapFrom(x => x.CustomerId))
                .ForMember(destination => destination.CustomerName,
                    origin => origin.MapFrom(x => $"{x.Customer.FirstName} {x.Customer.LastName}"))
                .ForMember(destination => destination.SaleDate, origin => origin.MapFrom(x => x.SaleDate))
                .ForMember(destination => destination.TotalAmount, origin => origin.MapFrom(x => x.TotalAmount))
                .ForMember(destination => destination.SoldProducts, origin => origin.MapFrom(x => x.SaleProducts))
                .ReverseMap();
        }
    }
}
