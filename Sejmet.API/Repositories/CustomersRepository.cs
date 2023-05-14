using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class CustomersRepository : ICustomersRepository
    {
        private readonly SejmetDbContext _context;
        private readonly IMapper _mapper;

        public CustomersRepository(SejmetDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IList<CreateProductDTO>> GetAllAsync(int? provinceId, Guid? cityId, string? firstName, string? lastName, CancellationToken cancellationToken)
        {
            var query = _context.Customers.Include(x => x.HealtcareProvider).AsQueryable();

            if (provinceId.HasValue)
            {
                query = query.Where(x => x.ProvinceId == provinceId.Value);
            }

            if (cityId.HasValue)
            {
                query = query.Where(x => x.CityId == cityId);
            }

            if (!string.IsNullOrWhiteSpace(firstName))
            {
                query = query.Where(x => x.FirstName == firstName);
            }

            if (!string.IsNullOrWhiteSpace(lastName))
            {
                query = query.Where(x => x.LastName == lastName);
            }

            try
            {
                var customers = await query.ToListAsync(cancellationToken).ConfigureAwait(false);
                var customersDTOs = _mapper.Map<List<CreateProductDTO>>(customers);

                return customersDTOs;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CreateProductDTO> CreateCustomerAsync(CreateProductDTO customerDTO, CancellationToken cancellationToken)
        {
            var customer = _mapper.Map<Customer>(customerDTO);

            try
            {
                await _context.Customers.AddAsync(customer, cancellationToken);
                await _context.SaveChangesAsync(cancellationToken);
                return _mapper.Map<CreateProductDTO>(customer);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<UpdateCustomerDTO?> UpdateCustomerAsync(Guid customerId, UpdateCustomerDTO customerDTO, CancellationToken cancellationToken)
        {
            var customer = await _context.Customers.FirstOrDefaultAsync(x =>  x.Id == customerId, cancellationToken);

            if (customer == null)
            {
                return null;
            }

            _mapper.Map(customerDTO, customer);
            await _context.SaveChangesAsync(cancellationToken);

            return customerDTO;
        }

        public async Task<CreateProductDTO?> DeleteCustomerAsync(Guid customerId, CancellationToken cancellationToken)
        {
            var customer = await _context.Customers.FirstOrDefaultAsync(x => x.Id == customerId, cancellationToken);

            if (customer == null)
            {
                return null;
            }

            _context.Customers.Remove(customer);

            await _context.SaveChangesAsync(cancellationToken);

            return _mapper.Map<CreateProductDTO>(customer);
        }
    }
}
