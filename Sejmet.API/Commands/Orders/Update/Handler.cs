using MediatR;
using Microsoft.AspNetCore.Mvc;
using Sejmet.API.Errors.Order;
using Sejmet.API.Extensions;
using Sejmet.API.Repositories.Interfaces;

namespace Sejmet.API.Commands.Orders.Update
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
            if (request is null)
            {
                return this.BadRequest(OrderErrors.UpdateOrderBodyIsEmpty);
            }

            try
            {
                var updatedOrder = await _ordersRepository.UpdateOrderAsync(request.Body, cancellationToken);
                return this.Ok(updatedOrder);
            }
            catch (Exception)
            {
                return this.InternalServerError(OrderErrors.UpdateOrderError);
            }
        }
    }
}
