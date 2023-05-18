using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Province
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<City> Cities { get; set; } = new List<City>();

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual ICollection<Provider> Providers { get; set; } = new List<Provider>();
}
