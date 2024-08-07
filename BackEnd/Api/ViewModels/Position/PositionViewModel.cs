using Api.ViewModels.Application;
using Api.ViewModels.CategoryPosition;
using Api.ViewModels.Company;
using Api.ViewModels.Language;
using Api.ViewModels.Level;
using Api.ViewModels.Recruiter;
using Api.ViewModels.Requirement;
using System.ComponentModel.DataAnnotations;

namespace Api.ViewModels.Position
{
    public class PositionViewModel
    {
        [Key]
        public Guid PositionId { get; set; }

        public string? PositionName { get; set; }

        public string? ImageURL { get; set; }

        public string? Description { get; set; }

        public decimal? MinSalary { get; set; }
        public decimal? MaxSalary { get; set; }

        public int MaxHiringQty { get; set; }
        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }
        public Guid CompanyId { get; set; }

        public CompanyViewModel Company { get; set; }

        public LanguageViewModel Language { get; set; }

        public Guid RecruiterId { get; set; }

        public RecruiterViewModel Recruiter { get; set; } = null!;

        public Guid CategoryPositionId { get; set; }
        public Guid LevelId { get; set; }
        public LevelViewModel Level { get; set; }

        public CategoryPositionViewModel CategoryPosition { get; set; } 

        public bool IsDeleted { get; set; } = false;

        public virtual ICollection<ApplicationViewModel> Applications { get; set; } = new List<ApplicationViewModel>();
        public virtual ICollection<RequirementViewModel> Requirements { get; set; } = new List<RequirementViewModel>();
    }
}