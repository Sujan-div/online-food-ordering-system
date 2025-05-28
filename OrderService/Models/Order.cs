using System;
using System.ComponentModel.DataAnnotations;

namespace OrderService.Models
{
    public class Order
    {
        [Key]
        public Guid OrderId { get; set; }

        [Required]
        public Guid UserId { get; set; }

        [Required]
        public Guid RestaurantId { get; set; }

        [Required]
        public decimal TotalAmount { get; set; }

        public DateTime OrderDate { get; set; } = DateTime.UtcNow;

        [Required]
        [MaxLength(50)]
        public string Status { get; set; } = "Pending"; // e.g. Pending, Completed, Cancelled

        public List<OrderItem> Items { get; set; }
    }
}
