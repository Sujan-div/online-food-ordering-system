using UserService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace UserService.Repositories
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetAllUsersAsync();
        Task<User> GetUserByIdAsync(Guid id);
        Task CreateUserAsync(User user);
        Task UpdateUserAsync(User user);
        Task DeleteUserAsync(Guid id);
        Task<User?> GetUserByEmailAsync(object email);
        Task AddUserAsync(User user);
    }
}
