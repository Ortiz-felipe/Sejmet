using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.DTOs;
using Sejmet.API.Models.DTOs.Orders;
using Sejmet.API.Models.Entities;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Repositories
{
    public class OrdersRepository : IOrdersRepository
    {
        private readonly SejmetDbContext _context;
        private readonly IMapper _mapper;

        public OrdersRepository(SejmetDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<PagedResponseDTO<OrderDTO>> GetAllOrdersAsync(string providerName, int currentPage, int pageSize, CancellationToken cancellationToken)
        {
            var query = _context.Orders
                                            .Include(x => x.Provider)
                                            .Include(x => x.OrderProducts)
                                            .ThenInclude(x => x.Product).AsQueryable();

            if (!string.IsNullOrWhiteSpace(providerName))
            {
                query = query.Where(x => x.Provider.Name.Contains(providerName));
            }

            var totalRecords = query.Count();

            var orders = await query.Skip((pageSize * (currentPage - 1))).Take(pageSize).ToListAsync(cancellationToken);

            return new PagedResponseDTO<OrderDTO>()
            {
                Items = _mapper.Map<List<OrderDTO>>(orders),
                PageSize = pageSize,
                CurrentPage = currentPage,
                TotalRecords = totalRecords,
                TotalPages = (int)Math.Ceiling((double)totalRecords / pageSize),
            };
        }

        public async Task<OrderDTO?> GetOrderByIdAsync(Guid orderId, CancellationToken cancellationToken)
        {
            var order = await _context.Orders
                                    .Include(x => x.Provider)
                                    .Include(x => x.OrderProducts)
                                    .ThenInclude(x => x.Product)
                                    .FirstOrDefaultAsync(x => x.Id == orderId, cancellationToken);

            return order is null ? null : _mapper.Map<OrderDTO>(order);
        }

        public async Task<CreateOrderDTO> CreateOrderAsync(CreateOrderDTO orderDTO, CancellationToken cancellationToken)
        {
            var newOrder = _mapper.Map<Order>(orderDTO);

            await _context.AddAsync(newOrder, cancellationToken);
            await _context.SaveChangesAsync(cancellationToken);

            return _mapper.Map<CreateOrderDTO>(newOrder);
        }

        public async Task<OrderDTO?> UpdateOrderAsync(UpdateOrderDTO orderDTO, CancellationToken cancellationToken)
        {
            var orderToUpdate = await _context.Orders
                .Include(x => x.Provider)
                .Include(x => x.OrderProducts)
                .ThenInclude(x => x.Product)
                .FirstOrDefaultAsync(x => x.Id == orderDTO.OrderId, cancellationToken);

            if (orderToUpdate is null)
            {
                return null;
            }

            orderToUpdate.TransactionStatusId = orderDTO.TransactionStatusId;
            orderToUpdate.RecievedDate = DateTime.UtcNow;

            if (orderDTO.TransactionStatusId == (int)TransactionStatusesEnum.Recieved)
            {
                foreach (var product in orderToUpdate.OrderProducts)
                {
                    var updatedProduct = await _context.Products.FirstOrDefaultAsync(x => x.Id == product.ProductId, cancellationToken);

                    if (updatedProduct != null)
                    {
                        updatedProduct.CurrentStock += product.Quantity;
                    }
                }
            }

            await _context.SaveChangesAsync(cancellationToken);

            return _mapper.Map<OrderDTO>(orderToUpdate);

        }
    }
}
