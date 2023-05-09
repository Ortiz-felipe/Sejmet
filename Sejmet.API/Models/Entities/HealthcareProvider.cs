using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class HealthcareProvider
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public bool IsActive { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
}
