using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class ActiveCompound
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int MaxDosage { get; set; }

    public int TherapeuticEffectId { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();

    public virtual TherapeuticEffect TherapeuticEffect { get; set; } = null!;
}
