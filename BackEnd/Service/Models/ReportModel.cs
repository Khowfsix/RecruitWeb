﻿using Data.Entities;

namespace Service.Models
{
    public class ReportModel
    {
        public Guid ReportId { get; set; }
        public string? ReportName { get; set; }
        public string UserId { get; set; }
        public int ReportType { get; set; }
        public string FileURL { get; set; }
        public DateTime CreatedTime { get; set; }
        public bool IsDeleted { get; set; }
    }
}