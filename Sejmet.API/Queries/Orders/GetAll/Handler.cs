using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Order;
using Sejmet.API.Errors.Sales;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Queries.Orders.GetAll
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
                var orders = await _ordersRepository.GetAllOrdersAsync(request.ProviderName, request.CurrentPage,
                    request.PageSize, cancellationToken);

                return this.Ok(orders);
            }
            catch (Exception)
            {
                return this.InternalServerError(OrderErrors.GetAllOrdersError);
            }
        }
    }
}
