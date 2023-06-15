using AutoMapper;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class ProductProfile : Profile
    {
        public ProductProfile()
        {
            this.CreateMap<Product, ProductDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.Upc, origin => origin.MapFrom(x => x.Upc))
                .ForMember(destination => destination.TradeName, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.LaboratoryName, origin => origin.MapFrom(x => x.Laboratory.Name))
                .ForMember(destination => destination.DosageFormName, origin => origin.MapFrom(x => x.DosageForm.Name))
                .ForMember(destination => destination.ActiveCompoundName, origin => origin.MapFrom(x => x.ActiveCompound.Name))
                .ForMember(destination => destination.Container, origin => origin.MapFrom(x => x.Container))
                .ForMember(destination => destination.Dosage, origin => origin.MapFrom(x => x.Dosage))
                .ForMember(destination => destination.Price, origin => origin.MapFrom(x => x.Price))
                .ForMember(destination => destination.CurrentStock, origin => origin.MapFrom(x => x.CurrentStock));
        }
    }
}
