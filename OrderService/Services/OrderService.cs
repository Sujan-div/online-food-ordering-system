using OrderService.Models;
using OrderService.Repositories;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace OrderService.Services
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepository;

        public OrderService(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public async Task<IEnumerable<Order>> GetAllOrdersAsync()
        {
            return await _orderRepository.GetAllOrdersAsync();
        }

        public async Task<Order> GetOrderByIdAsync(Guid orderId)
        {
            return await _orderRepository.GetOrderByIdAsync(orderId);
        }

        public async Task<IEnumerable<Order>> GetOrdersByUserIdAsync(Guid userId)
        {
            return await _orderRepository.GetOrdersByUserIdAsync(userId);
        }

        public async Task<Order> CreateOrderAsync(Order order)
        {
            order.OrderDate = DateTime.UtcNow;
            order.Status = "Pending"; // default status
            return await _orderRepository.CreateOrderAsync(order);
        }

        public async Task<bool> UpdateOrderStatusAsync(Guid orderId, string newStatus)
        {
            return await _orderRepository.UpdateOrderStatusAsync(orderId, newStatus);
        }

        public async Task<bool> DeleteOrderAsync(Guid orderId)
        {
            return await _orderRepository.DeleteOrderAsync(orderId);
        }
    }
}
