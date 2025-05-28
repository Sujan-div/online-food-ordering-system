using PaymentService.Models;

namespace PaymentService.Repositories
{
    public interface IPaymentRepository
    {
        Task<IEnumerable<Payment>> GetAllAsync();
        Task<Payment?> GetByIdAsync(Guid paymentId);
        Task<Payment> CreateAsync(Payment payment);
        Task<bool> UpdateStatusAsync(Guid paymentId, string newStatus);
        Task<bool> DeleteAsync(Guid paymentId);
    }
}
