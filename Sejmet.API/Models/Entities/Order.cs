using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Order
{
    public Guid Id { get; set; }

    public Guid ProviderId { get; set; }

    public decimal TotalAmount { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime RecievedDate { get; set; }

    public int TransactionStatusId { get; set; }

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual Provider Provider { get; set; } = null!;

    public virtual TransactionStatus TransactionStatus { get; set; } = null!;
}
