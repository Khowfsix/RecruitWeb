namespace Api.ViewModels.Interview
{
    public class InterviewFilterModel
    {
        public string? Search { get; set; }
        public int? CandidateStatus { get; set; }
        public int? CompanyStatus { get; set; }
        public string? FromTime { get; set; }
        public string? ToTime { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public Guid? PositionId { get; set; }
        public int? InterviewType { get; set; }
    }
}