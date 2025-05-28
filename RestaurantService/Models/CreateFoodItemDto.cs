namespace RestaurantService.Models
{
    public class CreateFoodItemDto
    {
        public string Name { get; set; } = string.Empty;

        public decimal Price { get; set; }

        public string Description { get; set; } = string.Empty;

        public Guid RestaurantId { get; set; }
    }
}
