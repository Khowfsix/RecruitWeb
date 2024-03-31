using Api.ViewModels.Certificate;

namespace Api.ViewModels.Cv
{
    public class CvUpdateModel
    {
        public Guid Cvid { get; set; }
        public Guid CandidateId { get; set; }
        public string? Experience { get; set; }
        public string? CvPdf { get; set; }

        public string CvName { get; set; } = string.Empty;

        public string Introduction { get; set; } = string.Empty;

        public string Education { get; set; } = string.Empty;

        public bool IsDeleted { get; set; }
        public IList<CvSkillRelationUpdateModel> Skills { get; set; } = new List<CvSkillRelationUpdateModel>();
        public IList<CertificateUpdateModel> Certificates { get; set; } = new List<CertificateUpdateModel>();
    }

    public class CvSkillRelationUpdateModel
    {
        public Guid SkillId { get; set; }
        public int ExperienceYear { get; set; }
    }
}