using RestaurantService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RestaurantService.Repositories
{
    public interface IRestaurantRepository
    {
        Task<IEnumerable<Restaurant>> GetAllAsync();
        Task<Restaurant> GetByIdAsync(Guid id);
        Task<Restaurant> AddAsync(Restaurant restaurant);
        Task UpdateAsync(Restaurant restaurant);
        Task DeleteAsync(Guid id);
    }
}