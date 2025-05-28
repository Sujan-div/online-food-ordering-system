using Microsoft.AspNetCore.Mvc;
using OrderService.Data;
using OrderService.Models;
using OrderService.Services;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace OrderService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService _orderService;

        private readonly OrderDbContext _context;

        public OrderController(IOrderService orderService, OrderDbContext context)
        {
            _orderService = orderService;
            _context = context;
        }
     
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var orders = await _orderService.GetAllOrdersAsync();
            return Ok(orders);
        }
   
        [HttpPost]
    public async Task<IActionResult> CreateOrder(CreateOrderDto dto)
    {
        var order = new Order
        {
            OrderId = Guid.NewGuid(),
            UserId = dto.UserId,
            RestaurantId = dto.RestaurantId,
            OrderDate = DateTime.UtcNow,
            Status = "Pending",
            Items = dto.Items.Select(i => new OrderItem
            {
                OrderItemId = Guid.NewGuid(),
                FoodItemId = i.FoodItemId,
                Name = i.Name,
                Price = i.Price,
                Quantity = i.Quantity
            }).ToList()
        };

        order.TotalAmount = order.Items.Sum(i => i.Price * i.Quantity);

        _context.Orders.Add(order);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetById), new { id = order.OrderId }, order);
    }



       
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            var order = await _orderService.GetOrderByIdAsync(id);
            if (order == null) return NotFound();
            return Ok(order);
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetByUserId(Guid userId)
        {
            var orders = await _orderService.GetOrdersByUserIdAsync(userId);
            return Ok(orders);
        }

        // [HttpPost]
        // public async Task<IActionResult> Create(Order order)
        // {
        //     if (!ModelState.IsValid)
        //         return BadRequest(ModelState);

        //     var created = await _orderService.CreateOrderAsync(order);
        //     return CreatedAtAction(nameof(GetById), new { id = created.OrderId }, created);
        // }
      
        [HttpPut("{id}/status")]
        public async Task<IActionResult> UpdateStatus(Guid id, [FromQuery] string newStatus)
        {
            var updated = await _orderService.UpdateOrderStatusAsync(id, newStatus);
            if (!updated) return NotFound();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id)
        {
            var deleted = await _orderService.DeleteOrderAsync(id);
            if (!deleted) return NotFound();
            return NoContent();
        }
    }
}
