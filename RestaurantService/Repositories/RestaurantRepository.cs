using Microsoft.EntityFrameworkCore;
using RestaurantService.Data;
using RestaurantService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RestaurantService.Repositories
{
    public class RestaurantRepository : IRestaurantRepository
    {
        private readonly RestaurantDbContext _context;

        public RestaurantRepository(RestaurantDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Restaurant>> GetAllAsync()
        {
            return await _context.Restaurants.ToListAsync();
        }

        public async Task<Restaurant> GetByIdAsync(Guid id)
        {
            return await _context.Restaurants.FindAsync(id);
        }

        public async Task<Restaurant> AddAsync(Restaurant restaurant)
        {
            _context.Restaurants.Add(restaurant);
            await _context.SaveChangesAsync();
            return restaurant;
        }

        public async Task UpdateAsync(Restaurant restaurant)
        {
            _context.Entry(restaurant).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Guid id)
        {
            var restaurant = await _context.Restaurants.FindAsync(id);
            if (restaurant != null)
            {
                _context.Restaurants.Remove(restaurant);
                await _context.SaveChangesAsync();
            }
        }
    }
}