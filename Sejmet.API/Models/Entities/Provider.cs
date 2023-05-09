using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Provider
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string PointOfContact { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Cuit { get; set; } = null!;

    public Guid CityId { get; set; }

    public int ProvinceId { get; set; }

    public DateTime CreateDate { get; set; }

    public virtual City City { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual Province Province { get; set; } = null!;
}
