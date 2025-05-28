using System.ComponentModel.DataAnnotations;

namespace RestaurantService.Models
{
    public class Restaurant
    {
        [Key]
        public Guid RestaurantId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Cuisine { get; set; }
        public double Rating { get; set; }

         public ICollection<FoodItem> FoodItems { get; set; } = new List<FoodItem>();

    }
}