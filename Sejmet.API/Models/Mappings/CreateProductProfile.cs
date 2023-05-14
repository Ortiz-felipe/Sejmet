using AutoMapper;
using Sejmet.API.Models.DTOs.Products;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Models.Mappings
{
    public class CreateProductProfile : Profile
    {
        public CreateProductProfile() 
        {
            this.CreateMap<CreateProductDTO, Product>()
                .ForMember(destination => destination.TradeName, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.Upc, origin => origin.MapFrom(x => x.Upc))
                .ForMember(destination => destination.LaboratoryId, origin => origin.MapFrom(x => x.LaboratoryId))
                .ForMember(destination => destination.ActiveCompoundId, origin => origin.MapFrom(x => x.ActiveCompoundId))
                .ForMember(destination => destination.DosageFormId, origin => origin.MapFrom(x => x.DosageFormId))
                .ForMember(destination => destination.Price, origin => origin.MapFrom(x => x.Price))
                .ForMember(destination => destination.Container, origin => origin.MapFrom(x => x.Container))
                .ForMember(destination => destination.Dosage, origin => origin.MapFrom(x => x.Dosage))
                .ForMember(destination => destination.Container, origin => origin.MapFrom(x => x.Container))
                .ForMember(destination => destination.CurrentStock, origin => origin.MapFrom(x => x.CurrentStock));

            this.CreateMap<Product, CreateProductDTO>()
                .ForMember(destination => destination.Id, origin => origin.MapFrom(x => x.Id))
                .ForMember(destination => destination.TradeName, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.Upc, origin => origin.MapFrom(x => x.TradeName))
                .ForMember(destination => destination.LaboratoryId, origin => origin.MapFrom(x => x.LaboratoryId))
                .ForMember(destination => destination.LaboratoryName, origin => origin.MapFrom(x => x.Laboratory.Name))
                .ForMember(destination => destination.ActiveCompoundId, origin => origin.MapFrom(x => x.ActiveCompoundId))
                .ForMember(destination => destination.ActiveCompoundName, origin => origin.MapFrom(x => x.ActiveCompound.Name))
                .ForMember(destination => destination.DosageFormId, origin => origin.MapFrom(x => x.DosageFormId))
                .ForMember(destination => destination.DosageFormName, origin => origin.MapFrom(x => x.DosageForm.Name))
                .ForMember(destination => destination.Price, origin => origin.MapFrom(x => x.Price))
                .ForMember(destination => destination.Dosage, origin => origin.MapFrom(x => x.Dosage))
                .ForMember(destination => destination.CurrentStock, origin => origin.MapFrom(x => x.CurrentStock))
                .ForMember(destination => destination.MaxDosage, origin => origin.MapFrom(x => x.ActiveCompound.MaxDosage))
                .ForMember(destination => destination.TherapeuticEffectId, origin => origin.MapFrom(x => x.ActiveCompound.TherapeuticEffectId))
                .ForMember(destination => destination.TherapeuticEffectName, origin => origin.MapFrom(x => x.ActiveCompound.TherapeuticEffect.Name));
        }
    }
}
