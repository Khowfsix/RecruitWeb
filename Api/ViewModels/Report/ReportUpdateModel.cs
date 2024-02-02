﻿namespace Api.ViewModels.Report
{
    public class ReportViewModel
    {
        public Guid ReportId { get; set; }
        public string? ReportName { get; set; }

        public Guid RecruiterId { get; set; }

        public bool IsDeleted { get; set; } = false;
    }
}