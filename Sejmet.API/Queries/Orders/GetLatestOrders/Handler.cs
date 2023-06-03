using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Order;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Orders.GetLatestOrders
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
                var latestOrders = await _ordersRepository.GetTopLatestOrdersAsync(cancellationToken);
                return this.Ok(latestOrders);
            }
            catch (Exception)
            {
                return this.InternalServerError(OrderErrors.GetTopLatestOrderError);
            }
            
        }       
    }
}
