namespace RestaurantService.Models
{
public class FoodItemDto
{
    public Guid FoodItemId { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public string Description { get; set; }
}
}