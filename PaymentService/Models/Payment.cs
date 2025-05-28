using System;
using System.ComponentModel.DataAnnotations;

namespace PaymentService.Models
{
    public class Payment
    {
        [Key]
        public Guid PaymentId { get; set; }

        [Required]
        public Guid UserId { get; set; }

        [Required]
        public Guid OrderId { get; set; }

        [Required]
        [Range(0.01, double.MaxValue)]
        public decimal Amount { get; set; }

        [Required]
        [MaxLength(20)]
        public string PaymentMethod { get; set; } = "Online";

        [Required]
        [MaxLength(20)]
        public string Status { get; set; } = "Pending";

        public DateTime PaymentDate { get; set; } = DateTime.UtcNow;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}
