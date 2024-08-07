using Data.Interfaces;
using Data.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace Data
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddRepository(this IServiceCollection service)
        {
            service.AddTransient(typeof(IUnitOfWork), typeof(UnitOfWork));
            service.AddTransient(typeof(IRepository<>), typeof(Repository<>));
            service.AddTransient(typeof(IInterviewRepository), typeof(InterviewRepository));
            service.AddTransient(typeof(IInterviewerRepository), typeof(InterviewerRepository));
            service.AddTransient(typeof(IItrsinterviewRepository), typeof(ItrsinterviewRepository));
            service.AddTransient(typeof(IRecruiterRepository), typeof(RecruiterRepository));
            service.AddTransient(typeof(ILanguageRepository), typeof(LanguageRepository));
            service.AddTransient(typeof(IPositionRepository), typeof(PositionRepository));
            service.AddTransient(typeof(IQuestionRepository), typeof(QuestionRepository));
            service.AddTransient(typeof(IQuestionSkillRepository), typeof(QuestionSkillRepository));
            service.AddTransient(typeof(IReportRepository), typeof(ReportRepository));
            service.AddTransient(typeof(IRoundRepository), typeof(RoundRepository));
            service.AddTransient(typeof(IShiftRepository), typeof(ShiftRepository));
            service.AddTransient(typeof(ISkillRepository), typeof(SkillRepository));
            service.AddTransient(typeof(ISuccessfulCadidateRepository), typeof(SuccessfulCadidateRepository));
            service.AddTransient(typeof(IRequirementRepository), typeof(RequirementRepository));
            service.AddTransient(typeof(IResultRepository), typeof(ResultRepository));
            service.AddTransient(typeof(IRoomRepository), typeof(RoomRepository));
            service.AddTransient(typeof(ICategoryQuestionRepository), typeof(CategoryQuestionRepository));
            service.AddTransient(typeof(ICertificateRepository), typeof(CertificateRepository));
            service.AddTransient(typeof(ICvRepository), typeof(CvRepository));
            service.AddTransient(typeof(ICompanyRepository), typeof(CompanyRepository));
            service.AddTransient(typeof(IEventRepository), typeof(EventRepository));
            service.AddTransient(typeof(IApplicationRepository), typeof(ApplicationRepository));
            service.AddTransient(typeof(IBlacklistRepository), typeof(BlackListRepository));
            service.AddTransient(typeof(ICandidateJoinEventRepository), typeof(CandidateJoinEventRepository));
            service.AddTransient(typeof(ICandidateRepository), typeof(CandidateRepository));
            service.AddTransient(typeof(IFileRepository), typeof(FileRepository));
            service.AddTransient(typeof(ISecurityAnswerRepository), typeof(SecurityAnswerRepository));
            service.AddTransient(typeof(ISecurityQuestionRepository), typeof(SecurityQuestionRepository));
            service.AddTransient(typeof(ICategoryPositionRepository), typeof(CategoryPositionRepository));
            service.AddTransient(typeof(IRefreshTokenRepository), typeof(RefreshTokenRepository));
            service.AddTransient(typeof(ICandidateHasSkillrepository), typeof(CandidateHasSkillRepository));
            service.AddTransient(typeof(IEventHasPositionRepository), typeof(EventHasPositionRepository));
            service.AddTransient(typeof(ILevelRepository), typeof(LevelRepository));
            service.AddTransient(typeof(IRoleRepository), typeof(RoleRepository));
            service.AddTransient(typeof(IUserRoleRepository), typeof(UserRoleRepository));
            service.AddTransient(typeof(IAwardRepository), typeof(AwardRepository));
            service.AddTransient(typeof(IEducationRepository), typeof(EducationRepository));
            service.AddTransient(typeof(IPersonalProjectRepository), typeof(PersonalProjectRepository));
            service.AddTransient(typeof(IQuestionLanguageRepository), typeof(QuestionLanguageRepository));
            service.AddTransient(typeof(IWorkExperienceRepository), typeof(WorkExperienceRepository));
            return service;
        }
    }
}