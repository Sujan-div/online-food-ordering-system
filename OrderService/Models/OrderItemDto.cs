
namespace OrderService.Models
{
public class OrderItemDto
{
    public Guid FoodItemId { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
}
}