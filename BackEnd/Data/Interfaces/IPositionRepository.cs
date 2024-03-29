using Data.Entities;

namespace Data.Interfaces
{
    public interface IPositionRepository : IRepository<Position>
    {
        Task<List<Position>> GetAllPositions(bool isAdmin);
        Task<List<Position>> GetAllPositionsByUserId(String userId);

        Task<Position?> GetPositionById(Guid id);

        Task<List<Position>> GetPositionByName(string name);

        Task<Position> AddPosition(Position position);

        Task<bool> UpdatePosition(Position position, Guid positionId);

        Task<bool> RemovePosition(Guid positionId);
    }
}