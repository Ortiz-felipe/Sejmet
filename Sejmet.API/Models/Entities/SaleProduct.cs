using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class SaleProduct
{
    public Guid SaleId { get; set; }

    public Guid ProductId { get; set; }

    public int Quantity { get; set; }

    public decimal UnitPrice { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual Sale Sale { get; set; } = null!;
}
