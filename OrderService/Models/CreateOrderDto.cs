using OrderService.Models;

namespace OrderService.Models
{
public class CreateOrderDto
{
    public Guid UserId { get; set; }
    public Guid RestaurantId { get; set; }
    public List<OrderItemDto> Items { get; set; }
}
}