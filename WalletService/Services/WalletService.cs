using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WalletService.Models;
using WalletService.Repositories;

namespace WalletService.Services
{
    public class WalletService : IWalletService
    {
        private readonly IWalletRepository _walletRepository;

        public WalletService(IWalletRepository walletRepository)
        {
            _walletRepository = walletRepository;
        }

        public async Task<IEnumerable<Wallet>> GetAllWalletsAsync()
        {
            return await _walletRepository.GetAllWalletsAsync();
        }

        public async Task<Wallet> GetWalletByIdAsync(Guid walletId)
        {
            return await _walletRepository.GetWalletByIdAsync(walletId);
        }

        public async Task<Wallet> GetWalletByUserIdAsync(Guid userId)
        {
            return await _walletRepository.GetWalletByUserIdAsync(userId);
        }

        public async Task<Wallet> CreateWalletAsync(Wallet wallet)
        {
            // Validate or perform any business logic before creating a wallet
            return await _walletRepository.CreateWalletAsync(wallet);
        }

        public async Task<bool> UpdateWalletAsync(Wallet wallet)
        {
            // You could add logic to update a wallet here (e.g., checking the wallet existence)
            return await _walletRepository.DeleteWalletAsync(wallet.WalletId) &&
                   (await _walletRepository.CreateWalletAsync(wallet) != null);
        }

        public async Task<bool> DeleteWalletAsync(Guid walletId)
        {
            return await _walletRepository.DeleteWalletAsync(walletId);
        }

        public async Task<bool> UpdateBalanceAsync(Guid userId, decimal amount, bool isCredit)
        {
            if (isCredit)
            {
                return await _walletRepository.CreditAsync(userId, amount);
            }
            else
            {
                return await _walletRepository.DebitAsync(userId, amount);
            }
        }

        public async Task<decimal?> GetBalanceAsync(Guid userId)
        {
            return await _walletRepository.GetBalanceAsync(userId);
        }
    }
}
