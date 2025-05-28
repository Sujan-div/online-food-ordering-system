using System.ComponentModel.DataAnnotations;

namespace UserService.Models
{
    public class User
    {
        [Key]
        public Guid UserId { get; set; }

        [Required]
        [MaxLength(100)]
        public string FullName { get; set; }

        [Required]
        [MaxLength(100)]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [MaxLength(100)]
        public string PasswordHash { get; set; }

        [MaxLength(15)]
        public string Phone { get; set; }

        [MaxLength(200)]
        public string Address { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}