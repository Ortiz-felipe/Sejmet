using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Sale
{
    public Guid Id { get; set; }

    public Guid CustomerId { get; set; }

    public decimal TotalAmount { get; set; }

    public DateTime SaleDate { get; set; }

    public int? TransactionStatusId { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<SaleProduct> SaleProducts { get; set; } = new List<SaleProduct>();

    public virtual TransactionStatus? TransactionStatus { get; set; }
}
