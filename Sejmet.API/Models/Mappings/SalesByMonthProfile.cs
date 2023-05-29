using AutoMapper;
using Sejmet.API.Models.DTOs.Sales;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class SalesByMonthProfile : Profile
    {
        public SalesByMonthProfile()
        {
            this.CreateMap<Sale, SalesByMonthDTO>()
                .ForMember(destination => destination.Month,
                    origin => origin.MapFrom(x => x.SaleDate.Month.ToString("MMMM")))
                .ForMember(destination => destination.TotalAmount, origin => origin.MapFrom(x => x.TotalAmount));
        }
    }
}
