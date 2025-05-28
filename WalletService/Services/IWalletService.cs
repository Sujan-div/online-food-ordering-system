using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WalletService.Models;

namespace WalletService.Services
{
    public interface IWalletService
    {
        Task<IEnumerable<Wallet>> GetAllWalletsAsync();
        Task<Wallet> GetWalletByIdAsync(Guid walletId);
        Task<Wallet> GetWalletByUserIdAsync(Guid userId);
        Task<Wallet> CreateWalletAsync(Wallet wallet);
        Task<bool> UpdateWalletAsync(Wallet wallet);
        Task<bool> DeleteWalletAsync(Guid walletId);
        Task<bool> UpdateBalanceAsync(Guid userId, decimal amount, bool isCredit);
        Task<decimal?> GetBalanceAsync(Guid userId);
    }
}
