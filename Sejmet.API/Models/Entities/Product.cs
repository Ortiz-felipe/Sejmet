using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Product
{
    public Guid Id { get; set; }

    public string Upc { get; set; } = null!;

    public string TradeName { get; set; } = null!;

    public Guid LaboratoryId { get; set; }

    public Guid ActiveCompoundId { get; set; }

    public int DosageFormId { get; set; }

    public decimal Price { get; set; }

    public int Container { get; set; }

    public int Dosage { get; set; }

    public int CurrentStock { get; set; }

    public virtual ActiveCompound ActiveCompound { get; set; } = null!;

    public virtual DosageForm DosageForm { get; set; } = null!;

    public virtual Laboratory Laboratory { get; set; } = null!;

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual ICollection<SaleProduct> SaleProducts { get; set; } = new List<SaleProduct>();
}
