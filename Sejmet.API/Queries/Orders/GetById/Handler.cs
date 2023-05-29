using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Order;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Orders.GetById
{
    public class Handler : IRequestHandler<QueryRequest, IActionResult>
    {
        private readonly IOrdersRepository _ordersRepository;

        public Handler(IOrdersRepository ordersRepository)
        {
            _ordersRepository = ordersRepository;
        }

        public async Task<IActionResult> Handle(QueryRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var order = await _ordersRepository.GetOrderByIdAsync(request.OrderId, cancellationToken);
                return order == null ? this.NotFound(OrderErrors.OrderIDNotFound) : this.Ok(order);
            }
            catch (Exception)
            {
                return this.InternalServerError(OrderErrors.GetOrderByIdError);
            }
        }
    }
}
