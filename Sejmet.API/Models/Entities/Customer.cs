using System;
using System.Collections.Generic;

namespace Sejmet.API.Models.Entities;

public partial class Customer
{
    public Guid Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Dni { get; set; } = null!;

    public DateTime Birthdate { get; set; }

    public int Age { get; set; }

    public Guid HealtcareProviderId { get; set; }

    public string PhoneNumber { get; set; } = null!;

    public string Address { get; set; } = null!;

    public Guid CityId { get; set; }

    public int ProvinceId { get; set; }

    public virtual City City { get; set; } = null!;

    public virtual HealthcareProvider HealtcareProvider { get; set; } = null!;

    public virtual Province Province { get; set; } = null!;

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();
}
