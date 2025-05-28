using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestaurantService.Data;
using RestaurantService.Models;
using Microsoft.AspNetCore.Authorization;

namespace RestaurantService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FoodItemController : ControllerBase
    {
        private readonly RestaurantDbContext _context;

        public FoodItemController(RestaurantDbContext context)
        {
            _context = context;
        }
   
        [HttpGet("restaurant/{restaurantId}")]
        public async Task<ActionResult<IEnumerable<FoodItem>>> GetByRestaurant(Guid restaurantId)
        {
            return await _context.FoodItems
                .Where(f => f.RestaurantId == restaurantId)
                .ToListAsync();
        }
     
        [HttpPost]
        public async Task<ActionResult<FoodItem>> Create(RestaurantService.Models.CreateFoodItemDto dto)
        {
              var foodItem = new FoodItem
    {
        FoodItemId = Guid.NewGuid(),
        Name = dto.Name,
        Price = dto.Price,
        Description = dto.Description,
        RestaurantId = dto.RestaurantId
    };
            _context.FoodItems.Add(foodItem);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetByRestaurant), new { restaurantId = foodItem.RestaurantId }, foodItem);
        }

        [HttpPut("{id}")]
public async Task<IActionResult> Update(Guid id, UpdateFoodItemDto dto)
{
    var existingFoodItem = await _context.FoodItems.FindAsync(id);
    if (existingFoodItem == null)
        return NotFound();

    // Map values from DTO to the existing entity
    existingFoodItem.Name = dto.Name;
    existingFoodItem.Price = dto.Price;
    existingFoodItem.Description = dto.Description;
    existingFoodItem.RestaurantId = dto.RestaurantId;

    _context.Entry(existingFoodItem).State = EntityState.Modified;
    await _context.SaveChangesAsync();

    return NoContent();
}

    
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id)
        {
            var item = await _context.FoodItems.FindAsync(id);
            if (item == null) return NotFound();

            _context.FoodItems.Remove(item);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
