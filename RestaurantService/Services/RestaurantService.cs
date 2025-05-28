using RestaurantService.Models;
using RestaurantService.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RestaurantService.Services
{
    public class RestaurantService : IRestaurantService
    {
        private readonly IRestaurantRepository _repository;

        public RestaurantService(IRestaurantRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Restaurant>> GetAllRestaurantsAsync()
        {
            return await _repository.GetAllAsync();
        }

        public async Task<Restaurant> GetRestaurantByIdAsync(Guid id)
        {
            return await _repository.GetByIdAsync(id);
        }

        public async Task<Restaurant> CreateRestaurantAsync(Restaurant restaurant)
        {
            return await _repository.AddAsync(restaurant);
        }

        public async Task UpdateRestaurantAsync(Restaurant restaurant)
        {
            await _repository.UpdateAsync(restaurant);
        }

        public async Task DeleteRestaurantAsync(Guid id)
        {
            await _repository.DeleteAsync(id);
        }
    }
}