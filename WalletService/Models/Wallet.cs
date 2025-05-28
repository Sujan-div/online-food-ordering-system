using System;
using System.ComponentModel.DataAnnotations;

namespace WalletService.Models
{
    public class Wallet
    {
        [Key]
        public Guid WalletId { get; set; }

        [Required]
        public Guid UserId { get; set; }

        [Required]
        [Range(0, double.MaxValue)]
        public decimal Balance { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    }
}
