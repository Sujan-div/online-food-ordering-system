using PaymentService.Models;

namespace PaymentService.Services
{
    public interface IPaymentService
    {
        Task<IEnumerable<Payment>> GetPaymentsAsync();
        Task<Payment?> GetPaymentAsync(Guid id);
        Task<Payment> AddPaymentAsync(Payment payment);
        Task<bool> ChangePaymentStatusAsync(Guid id, string status);
        Task<bool> RemovePaymentAsync(Guid id);
    }
}
