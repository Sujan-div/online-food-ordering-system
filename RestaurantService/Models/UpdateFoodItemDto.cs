namespace RestaurantService.Models
{
    public class UpdateFoodItemDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public Guid RestaurantId { get; set; }
    }
}