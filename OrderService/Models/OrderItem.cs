using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OrderService.Models
{
    public class OrderItem
    {
        [Key]
        public Guid OrderItemId { get; set; }

        [Required]
        public Guid OrderId { get; set; }

        [Required]
        public Guid FoodItemId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")] // To avoid truncation warnings
        public decimal Price { get; set; }

        [Required]
        public int Quantity { get; set; }

        public Order Order { get; set; }
    }
}
