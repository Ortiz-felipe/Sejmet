﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs.Customers;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class CustomersRepository : ICustomersRepository
    {
        private readonly SejmetDbContext _dbContext;
        private readonly IMapper _mapper;

        public CustomersRepository(SejmetDbContext context, IMapper mapper)
        {
            _dbContext = context;
            _mapper = mapper;
        }

        public async Task<IList<CustomerDTO>> GetAllAsync(int? provinceId, Guid? cityId, string? name, CancellationToken cancellationToken)
        {
            var query = _dbContext.Customers.Include(x => x.HealtcareProvider).AsQueryable();

            if (provinceId.HasValue)
            {
                query = query.Where(x => x.ProvinceId == provinceId.Value);
            }

            if (cityId.HasValue)
            {
                query = query.Where(x => x.CityId == cityId);
            }

            if (!string.IsNullOrWhiteSpace(name))
            {
                query = query.Where(x => x.FirstName.Contains(name) || x.LastName.Contains(name) );
            }
            

            try
            {
                var customers = await query.ToListAsync(cancellationToken).ConfigureAwait(false);
                var customersDTOs = _mapper.Map<List<CustomerDTO>>(customers);

                return customersDTOs;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<CustomerInfoDTO?> GetCustomerByDniAsync(string dni, CancellationToken cancellationToken)
        {
            var customer = await _dbContext.Customers.Include(x => x.HealtcareProvider).FirstOrDefaultAsync(x => x.Dni == dni, cancellationToken);

            return customer is null ? null : _mapper.Map<CustomerInfoDTO?>(customer);
        }

        public async Task<CustomerDTO> CreateCustomerAsync(CustomerDTO customerDTO, CancellationToken cancellationToken)
        {
            var customer = _mapper.Map<Customer>(customerDTO);

            try
            {
                await _dbContext.Customers.AddAsync(customer, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);
                return _mapper.Map<CustomerDTO>(customer);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<UpdateCustomerDTO?> UpdateCustomerAsync(Guid customerId, UpdateCustomerDTO customerDTO, CancellationToken cancellationToken)
        {
            var customer = await _dbContext.Customers.FirstOrDefaultAsync(x => x.Id == customerId, cancellationToken);

            if (customer == null)
            {
                return null;
            }

            _mapper.Map(customerDTO, customer);
            await _dbContext.SaveChangesAsync(cancellationToken);

            return customerDTO;
        }

        public async Task<CustomerDTO?> DeleteCustomerAsync(Guid customerId, CancellationToken cancellationToken)
        {
            var customer = await _dbContext.Customers.FirstOrDefaultAsync(x => x.Id == customerId, cancellationToken);

            if (customer == null)
            {
                return null;
            }

            _dbContext.Customers.Remove(customer);

            await _dbContext.SaveChangesAsync(cancellationToken);

            return _mapper.Map<CustomerDTO>(customer);
        }
    }
}
