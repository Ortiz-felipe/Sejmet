using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class City
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int PostalCode { get; set; }

    public int ProvinceId { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual ICollection<Provider> Providers { get; set; } = new List<Provider>();

    public virtual Province Province { get; set; } = null!;
}
