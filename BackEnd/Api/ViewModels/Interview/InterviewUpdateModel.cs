namespace Api.ViewModels.Interview
{
    public class InterviewUpdateModel
    {
        public Guid InterviewId { get; set; }
        public Guid RecruiterId { get; set; }
        public Guid InterviewerId { get; set; }
        public Guid ApplicationId { get; set; }
        public string? Notes { get; set; }
        public int? Priority { get; set; }
        public Guid ResultId { get; set; }
        public bool IsDeleted { get; set; } = false;
    }
}