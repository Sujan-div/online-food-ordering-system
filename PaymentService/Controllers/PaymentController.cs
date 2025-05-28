using Microsoft.AspNetCore.Mvc;
using PaymentService.Models;
using PaymentService.Services;
using Microsoft.AspNetCore.Authorization;

namespace PaymentService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        // GET: api/payment
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var payments = await _paymentService.GetPaymentsAsync();
            return Ok(payments);
        }

        // GET: api/payment/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            var payment = await _paymentService.GetPaymentAsync(id);
            if (payment == null) return NotFound();

            return Ok(payment);
        }

        // POST: api/payment
        [HttpPost]
        public async Task<IActionResult> Create(Payment payment)
        {
            var created = await _paymentService.AddPaymentAsync(payment);
            return CreatedAtAction(nameof(GetById), new { id = created.PaymentId }, created);
        }
  
        // PUT: api/payment/{id}/status
        [HttpPut("{id}/status")]
        public async Task<IActionResult> UpdateStatus(Guid id, [FromBody] string newStatus)
        {
            var updated = await _paymentService.ChangePaymentStatusAsync(id, newStatus);
            if (!updated) return NotFound();

            return NoContent();
        }
     
        // DELETE: api/payment/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id)
        {
            var deleted = await _paymentService.RemovePaymentAsync(id);
            if (!deleted) return NotFound();

            return NoContent();
        }
    }
}
