using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Order;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Orders.Create
{
    public class Handler : IRequestHandler<CommandRequest, IActionResult>
    {
        private readonly IOrdersRepository _ordersRepository;

        public Handler(IOrdersRepository ordersRepository)
        {
            _ordersRepository = ordersRepository;
        }

        public async Task<IActionResult> Handle(CommandRequest request, CancellationToken cancellationToken)
        {
            if (request.Body is null)
            {
                return this.BadRequest(OrderErrors.CreateNewOrderBodyIsEmpty);
            }

            try
            {
                var createdOrder = await _ordersRepository.CreateOrderAsync(request.Body, cancellationToken);

                return this.CreatedAtRoute("orders", createdOrder.OrderId, createdOrder);
            }
            catch (Exception)
            {
                return this.InternalServerError(OrderErrors.CreateNewOrderError);
            }
        }
    }
}
