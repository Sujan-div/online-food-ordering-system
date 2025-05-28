namespace RestaurantService.Models
{
    public class FoodItem
    {
        public Guid FoodItemId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }

        // Foreign key
        public Guid RestaurantId { get; set; }
        public Restaurant? Restaurant { get; set; }
    }
}