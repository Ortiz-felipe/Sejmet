using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.DTOs.Products;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ICustomersRepository
    {
        Task<IList<CustomerDTO>> GetAllAsync(int? provinceId, Guid? cityId, string? firstName, string? lastName, CancellationToken cancellationToken);
        Task<CustomerDTO> CreateCustomerAsync(CustomerDTO customerDTO, CancellationToken cancellationToken);
        Task<UpdateCustomerDTO?> UpdateCustomerAsync(Guid customerId, UpdateCustomerDTO customerDTO, CancellationToken cancellationToken);
        Task<CustomerDTO?> DeleteCustomerAsync(Guid customerId, CancellationToken cancellationToken);
    }
}
