using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WalletService.Models;
using WalletService.Data;

namespace WalletService.Repositories
{
    public class WalletRepository : IWalletRepository
    {
        private readonly WalletDbContext _context;

        public WalletRepository(WalletDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Wallet>> GetAllWalletsAsync()
        {
            return await _context.Wallets.ToListAsync();
        }

        public async Task<Wallet> GetWalletByIdAsync(Guid walletId)
        {
            return await _context.Wallets
                                 .FirstOrDefaultAsync(w => w.WalletId == walletId);
        }

        public async Task<Wallet> GetWalletByUserIdAsync(Guid userId)
        {
            return await _context.Wallets
                                 .FirstOrDefaultAsync(w => w.UserId == userId);
        }

        public async Task<Wallet> CreateWalletAsync(Wallet wallet)
        {
            await _context.Wallets.AddAsync(wallet);
            await _context.SaveChangesAsync();
            return wallet;
        }

        public async Task<bool> DeleteWalletAsync(Guid walletId)
        {
            var wallet = await _context.Wallets
                                       .FirstOrDefaultAsync(w => w.WalletId == walletId);
            if (wallet == null) return false;

            _context.Wallets.Remove(wallet);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> CreditAsync(Guid userId, decimal amount)
        {
            var wallet = await _context.Wallets
                                       .FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null || amount <= 0) return false;

            wallet.Balance += amount;
            wallet.UpdatedAt = DateTime.UtcNow;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DebitAsync(Guid userId, decimal amount)
        {
            var wallet = await _context.Wallets
                                       .FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null || amount <= 0 || wallet.Balance < amount) return false;

            wallet.Balance -= amount;
            wallet.UpdatedAt = DateTime.UtcNow;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<decimal?> GetBalanceAsync(Guid userId)
        {
            var wallet = await _context.Wallets
                                       .FirstOrDefaultAsync(w => w.UserId == userId);
            return wallet?.Balance;
        }
    }
}
