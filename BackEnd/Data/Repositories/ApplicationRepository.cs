using Data.Entities;
using Data.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Data.Repositories
{
    public class ApplicationRepository : Repository<Application>, IApplicationRepository
    {
        private readonly IUnitOfWork _uow;

        public ApplicationRepository(RecruitmentWebContext context, IUnitOfWork uow)
            : base(context)
        {
            _uow = uow;
        }

        public async Task<bool> DeleteApplication(Guid applicationId)
        {
            try
            {
                var application = GetById(applicationId);
                if (application == null)
                    return await Task.FromResult(false);

                application.IsDeleted = true;
                Entities.Update(application);

                _uow.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<IEnumerable<Application>> GetAllApplications()
        {
            var listData = await Entities.Include(a => a.Position)
                                     .Include(a => a.Cv)
                                     .ToListAsync();
            return listData;
        }

        public async Task<Application> SaveApplication(Application request)
        {
            try
            {
                request.ApplicationId = Guid.NewGuid();

                //application.PositionId = request.Position.PositionId;
                Entities.Add(request);
                _uow.SaveChanges();

                return await Task.FromResult(request);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<bool> UpdateApplication(Application request, Guid requestId)
        {
            try
            {
                request.ApplicationId = requestId;

                //application.PositionId = request.Position.PositionId;
                //application.Cvid = request.Cv.Cvid;

                Entities.Update(request);
                _uow.SaveChanges();

                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                //throw new Exception(ex.Message);
                return await Task.FromResult(false);
            }
        }

        public async Task<IEnumerable<Application>> GetApplicationHistory(Guid Cvid)
        {
            var data = await Entities
                .Where(entity => entity.Cvid == Cvid)
                .Include(entity => entity.Position)
                .OrderByDescending(entity => entity.CreatedTime)
                .ToListAsync();
            return data;
        }

        public async Task<Application?> GetApplicationById(Guid ApplicationId)
        {
            var data = await Entities.Include(a => a.Position)
                                     .Include(a => a.Cv)
                                     .Where(a => a.ApplicationId.Equals(ApplicationId))
                                     .AsNoTracking()
                                     .FirstOrDefaultAsync();
            if (data != null)
            {
                return data;
            }

            return null;
        }

        public async Task<IEnumerable<Application>> GetApplicationsWithStatus(
            int status,
            int priority
        )
        {
            var listData = await Entities
                .Where(a => a.Company_Status! == status && a.Priority! == priority)
                .ToListAsync();

            return listData;
        }

        public async Task<IEnumerable<Application>> ApplicationReport(DateTime fromDate, DateTime toDate)
        {
            var data = await Entities
                .AsNoTracking()
                .Where(x => fromDate <= x.CreatedTime && x.CreatedTime <= toDate)
                .Include(x => x.Cv).ThenInclude(x => x.Candidate).ThenInclude(x => x.User)
                .Include(x => x.Position).ThenInclude(x => x.Company)
                .Include(x => x.Position).ThenInclude(x => x.Language)
                .ToListAsync();

            return data;
        }
    }
}