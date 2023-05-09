using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class DosageForm
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
