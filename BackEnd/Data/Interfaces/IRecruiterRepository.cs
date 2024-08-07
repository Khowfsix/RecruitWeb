using Data.Entities;

namespace Data.Interfaces;

public interface IRecruiterRepository : IRepository<Recruiter>
{

    Task<bool> UpdateStatus(bool isActived, bool isDeleted, Guid requestId);
    Task<IEnumerable<Recruiter>> GetAllRecruiter();

    Task<Recruiter?> GetRecruiterById(Guid id);

    Task<Recruiter?> SaveRecruiter(Recruiter request);

    Task<bool> UpdateRecruiter(Recruiter request, Guid requestId);

    Task<bool> DeleteRecruiter(Guid requestId);

    Task<Recruiter> GetRecruiterByUserId(string userId);
    Task<Recruiter> GetNotDeletedRecruiterByUserId(string userId);
}