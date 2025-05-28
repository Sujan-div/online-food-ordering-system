using Microsoft.EntityFrameworkCore;
using WalletService.Models;

namespace WalletService.Data
{
    public class WalletDbContext : DbContext
    {
        public WalletDbContext(DbContextOptions<WalletDbContext> options)
            : base(options) { }

        public DbSet<Wallet> Wallets { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Wallet>(w =>
           {
            w.HasKey(wallet => wallet.WalletId);
            w.Property(wallet => wallet.Balance).HasPrecision(18, 2);
             });
            }
    }
}
