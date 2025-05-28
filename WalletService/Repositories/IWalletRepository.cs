using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WalletService.Models;

namespace WalletService.Repositories
{
    public interface IWalletRepository
    {
        Task<IEnumerable<Wallet>> GetAllWalletsAsync(); // Get all wallets
        Task<Wallet> GetWalletByIdAsync(Guid walletId); // Get a wallet by its ID
        Task<Wallet> GetWalletByUserIdAsync(Guid userId); // Get a wallet by user ID
        Task<Wallet> CreateWalletAsync(Wallet wallet); // Create a new wallet
        Task<bool> DeleteWalletAsync(Guid walletId); // Delete a wallet by its ID
        Task<bool> CreditAsync(Guid userId, decimal amount); // Credit an amount to the wallet
        Task<bool> DebitAsync(Guid userId, decimal amount); // Debit an amount from the wallet
        Task<decimal?> GetBalanceAsync(Guid userId); // Get the balance of the wallet by user ID
    }
}
