using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class TherapeuticEffect
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<ActiveCompound> ActiveCompounds { get; set; } = new List<ActiveCompound>();
}
