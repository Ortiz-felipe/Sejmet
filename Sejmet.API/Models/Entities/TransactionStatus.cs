using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class TransactionStatus
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();
}
