using Sejmet.API.Models.DTOs;

namespace Sejmet.API.Repositories.Interfaces
{
    public interface ICustomersRepository
    {
        Task<IList<CreateProductDTO>> GetAllAsync(int? provinceId, Guid? cityId, string? firstName, string? lastName, CancellationToken cancellationToken);
        Task<CreateProductDTO> CreateCustomerAsync(CreateProductDTO customerDTO, CancellationToken cancellationToken);
        Task<UpdateCustomerDTO?> UpdateCustomerAsync(Guid customerId, UpdateCustomerDTO customerDTO, CancellationToken cancellationToken);
        Task<CreateProductDTO?> DeleteCustomerAsync(Guid customerId, CancellationToken cancellationToken);
    }
}
