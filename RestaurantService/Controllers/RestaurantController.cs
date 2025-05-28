using Microsoft.AspNetCore.Mvc;
using RestaurantService.Data;
using RestaurantService.Models;
using RestaurantService.Services;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace RestaurantService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RestaurantController : ControllerBase
    {
        private readonly IRestaurantService _service;

        private readonly RestaurantDbContext _context;

        public RestaurantController(IRestaurantService service, RestaurantDbContext context)
        {
            _service = service;
            _context = context;
        }



        // [HttpGet]
        // public async Task<ActionResult<IEnumerable<ReadRestaurantDto>>> GetAll()
        // {
        //     return Ok(await _service.GetAllRestaurantsAsync());
        // }
 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RestaurantDto>>> GetAll([FromQuery] bool includeFoodItems = false)
        {
            var restaurants = includeFoodItems
                ? await _context.Restaurants
                    .Include(r => r.FoodItems)
                    .Select(r => new RestaurantDto
                    {
                        RestaurantId = r.RestaurantId,
                        Name = r.Name,
                        Address = r.Address,
                        Phone = r.Phone,
                        Cuisine = r.Cuisine,
                        Rating = r.Rating,
                        FoodItems = r.FoodItems.Select(f => new FoodItemDto
                        {
                            FoodItemId = f.FoodItemId,
                            Name = f.Name,
                            Price = f.Price,
                            Description = f.Description
                        }).ToList()
                    }).ToListAsync()

                : await _context.Restaurants
                    .Select(r => new RestaurantDto
                    {
                        RestaurantId = r.RestaurantId,
                        Name = r.Name,
                        Address = r.Address,
                        Phone = r.Phone,
                        Cuisine = r.Cuisine,
                        Rating = r.Rating,
                        FoodItems = null
                    }).ToListAsync();

            return Ok(restaurants);
        }

      
        [HttpGet("{id}")]
        public async Task<ActionResult<Restaurant>> GetById(Guid id)
        {
            var restaurant = await _service.GetRestaurantByIdAsync(id);
            if (restaurant == null) return NotFound();
            return Ok(restaurant);
        }

        
        [HttpPost]
        public async Task<ActionResult<Restaurant>> Create(CreateRestaurantDto dto)
        {
            var restaurant = new Restaurant
            {
                RestaurantId = Guid.NewGuid(),
                Name = dto.Name,
                Address = dto.Address,
                Phone = dto.Phone,
                Cuisine = dto.Cuisine,
                Rating = dto.Rating
            };

            var created = await _service.CreateRestaurantAsync(restaurant);
            return CreatedAtAction(nameof(GetById), new { id = created.RestaurantId }, created);
        }
     
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(Guid id, UpdateRestaurantDto dto)
        {
            var existingRestaurant = await _service.GetRestaurantByIdAsync(id);
            if (existingRestaurant == null) return NotFound();

            // Map DTO to existing model
            existingRestaurant.Name = dto.Name;
            existingRestaurant.Address = dto.Address;
            existingRestaurant.Phone = dto.Phone;
            existingRestaurant.Cuisine = dto.Cuisine;
            existingRestaurant.Rating = dto.Rating;

            await _service.UpdateRestaurantAsync(existingRestaurant);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id)
        {
            await _service.DeleteRestaurantAsync(id);
            return NoContent();
        }
    }
}