using PaymentService.Models;
using PaymentService.Repositories;

namespace PaymentService.Services
{
    public class PaymentService : IPaymentService
    {
        private readonly IPaymentRepository _repository;

        public PaymentService(IPaymentRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Payment>> GetPaymentsAsync()
        {
            return await _repository.GetAllAsync();
        }

        public async Task<Payment?> GetPaymentAsync(Guid id)
        {
            return await _repository.GetByIdAsync(id);
        }

        public async Task<Payment> AddPaymentAsync(Payment payment)
        {
            payment.PaymentId = Guid.NewGuid();
            payment.PaymentDate = DateTime.UtcNow;
            payment.CreatedAt = DateTime.UtcNow;
            return await _repository.CreateAsync(payment);
        }

        public async Task<bool> ChangePaymentStatusAsync(Guid id, string status)
        {
            return await _repository.UpdateStatusAsync(id, status);
        }

        public async Task<bool> RemovePaymentAsync(Guid id)
        {
            return await _repository.DeleteAsync(id);
        }
    }
}
