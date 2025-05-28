using System.ComponentModel.DataAnnotations;

namespace RestaurantService.Models
{
    public class CreateRestaurantDto
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public string Phone { get; set; }

        [Required]
        public string Cuisine { get; set; }

        public double Rating { get; set; } = 0;
    }
}
