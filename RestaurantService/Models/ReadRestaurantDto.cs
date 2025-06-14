using System;

namespace RestaurantService.Models
{
    public class ReadRestaurantDto
    {
        public Guid RestaurantId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Cuisine { get; set; }
        public double Rating { get; set; }
    }
}
