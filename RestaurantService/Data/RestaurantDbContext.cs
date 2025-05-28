using Microsoft.EntityFrameworkCore;
using RestaurantService.Models;

namespace RestaurantService.Data
{
    public class RestaurantDbContext : DbContext
    {
        public RestaurantDbContext(DbContextOptions<RestaurantDbContext> options)
            : base(options) { }

        public DbSet<Restaurant> Restaurants { get; set; }

          public DbSet<FoodItem> FoodItems { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Restaurant>(r =>
            {
                r.HasKey(x => x.RestaurantId);
                r.Property(x => x.Name).IsRequired().HasMaxLength(100);
                r.Property(x => x.Address).HasMaxLength(200);
                r.Property(x => x.Phone).HasMaxLength(20);
                r.Property(x => x.Cuisine).HasMaxLength(50);
                r.Property(x => x.Rating).HasPrecision(3, 2); // example: 4.75
                  r.HasMany(x => x.FoodItems)
                 .WithOne(x => x.Restaurant)
                 .HasForeignKey(x => x.RestaurantId)
                 .OnDelete(DeleteBehavior.Cascade);
            });

               modelBuilder.Entity<FoodItem>(f =>
            {
                f.HasKey(x => x.FoodItemId);
                f.Property(x => x.Name).IsRequired().HasMaxLength(100);
                f.Property(x => x.Price).HasColumnType("decimal(10, 2)");
                f.Property(x => x.Description).HasMaxLength(300);
            });
        }
    }
}