using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using WalletService.Models;
using WalletService.Services;

namespace WalletService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WalletController : ControllerBase
    {
        private readonly IWalletService _walletService;

        public WalletController(IWalletService walletService)
        {
            _walletService = walletService;
        }
  
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var wallets = await _walletService.GetAllWalletsAsync();
            return Ok(wallets);
        }

        [HttpGet("{walletId:guid}")]
        public async Task<IActionResult> GetById(Guid walletId)
        {
            var wallet = await _walletService.GetWalletByIdAsync(walletId);
            if (wallet == null) return NotFound();
            return Ok(wallet);
        }
   
        [HttpGet("user/{userId:guid}")]
        public async Task<IActionResult> GetByUserId(Guid userId)
        {
            var wallet = await _walletService.GetWalletByUserIdAsync(userId);
            if (wallet == null) return NotFound();
            return Ok(wallet);
        }
  
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Wallet wallet)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            var createdWallet = await _walletService.CreateWalletAsync(wallet);
            return CreatedAtAction(nameof(GetById), new { walletId = createdWallet.WalletId }, createdWallet);
        }

        [HttpDelete("{walletId:guid}")]
        public async Task<IActionResult> Delete(Guid walletId)
        {
            var success = await _walletService.DeleteWalletAsync(walletId);
            if (!success) return NotFound();
            return NoContent();
        }

        [HttpPost("credit")]
        public async Task<IActionResult> Credit([FromQuery] Guid userId, [FromQuery] decimal amount)
        {
            var success = await _walletService.UpdateBalanceAsync(userId, amount, isCredit: true);
            if (!success) return BadRequest("Unable to credit wallet.");
            return Ok("Wallet credited successfully.");
        }

        [HttpPost("debit")]
        public async Task<IActionResult> Debit([FromQuery] Guid userId, [FromQuery] decimal amount)
        {
            var success = await _walletService.UpdateBalanceAsync(userId, amount, isCredit: false);
            if (!success) return BadRequest("Unable to debit wallet. Check balance.");
            return Ok("Wallet debited successfully.");
        }

        [HttpGet("balance/{userId:guid}")]
        public async Task<IActionResult> GetBalance(Guid userId)
        {
            var balance = await _walletService.GetBalanceAsync(userId);
            if (balance == null) return NotFound();
            return Ok(balance);
        }
    }
}
