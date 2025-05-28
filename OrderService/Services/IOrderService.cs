using OrderService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace OrderService.Services
{
    public interface IOrderService
    {
        Task<IEnumerable<Order>> GetAllOrdersAsync();
        Task<Order> GetOrderByIdAsync(Guid orderId);
        Task<IEnumerable<Order>> GetOrdersByUserIdAsync(Guid userId);
        Task<Order> CreateOrderAsync(Order order);
        Task<bool> UpdateOrderStatusAsync(Guid orderId, string newStatus);
        Task<bool> DeleteOrderAsync(Guid orderId);
    }
}
