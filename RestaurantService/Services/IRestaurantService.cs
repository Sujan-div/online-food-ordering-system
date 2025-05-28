using RestaurantService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RestaurantService.Services
{
    public interface IRestaurantService
    {
        Task<IEnumerable<Restaurant>> GetAllRestaurantsAsync();
        Task<Restaurant> GetRestaurantByIdAsync(Guid id);
        Task<Restaurant> CreateRestaurantAsync(Restaurant restaurant);
        Task UpdateRestaurantAsync(Restaurant restaurant);
        Task DeleteRestaurantAsync(Guid id);
    }
}